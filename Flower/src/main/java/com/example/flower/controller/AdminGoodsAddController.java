package com.example.flower.controller;

import com.example.flower.model.Goods;
import com.example.flower.service.GoodsService;
import com.example.flower.service.TypeService;
import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("/admin/goods_add")
public class AdminGoodsAddController {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private TypeService typeService;

    @Autowired
    private ServletContext servletContext;

    // 显示添加表单 (GET)
    @GetMapping
    public String showAddForm(Model model) {
        model.addAttribute("typeList", typeService.getAllType());
        return "admin/goods_add";
    }

    @PostMapping
    public String add(
            @RequestParam("name") String name,
            @RequestParam("price") float price,
            @RequestParam("intro") String intro,
            @RequestParam("cover") MultipartFile coverFile,
            @RequestParam("image1") MultipartFile image1File,
            @RequestParam("image2") MultipartFile image2File,
            @RequestParam("stock") int stock,
            @RequestParam("typeid") int typeid,
            Model model,// 添加 Model 参数
            RedirectAttributes redirectAttributes) {

        Goods goods = new Goods();
        goods.setName(name);
        goods.setPrice(price);
        goods.setIntro(intro);
        goods.setStock(stock);
        goods.setTypeid(typeid);

        try {
            // 处理文件上传
            goods.setCover(handleFileUpload(coverFile));
            goods.setImage1(handleFileUpload(image1File));
            goods.setImage2(handleFileUpload(image2File));

            // 检查文件大小 (限制为10MB)
            long maxSize = 10 * 1024 * 1024; // 10MB

            if (coverFile.getSize() > maxSize) {
                model.addAttribute("error", "封面图片大小超过10MB限制");
                model.addAttribute("typeList", typeService.getAllType());
                return "admin/goods_add";
            }

            if (image1File.getSize() > maxSize) {
                model.addAttribute("error", "详情图片1大小超过10MB限制");
                model.addAttribute("typeList", typeService.getAllType());
                return "admin/goods_add";
            }

            if (image2File.getSize() > maxSize) {
                model.addAttribute("error", "详情图片2大小超过10MB限制");
                model.addAttribute("typeList", typeService.getAllType());
                return "admin/goods_add";
            }


            goodsService.insert(goods);
            redirectAttributes.addFlashAttribute("successMsg", "商品添加成功！");
            return "redirect:/admin/goods_list?pageNumber=1&type=0&t=" + System.currentTimeMillis();
        } catch (Exception e) {
            e.printStackTrace();
            // 处理错误，返回添加页面并显示错误信息
            model.addAttribute("typeList", typeService.getAllType());
            model.addAttribute("error", "商品添加失败: " + e.getMessage());
            return "admin/goods_add";
        }
    }

    private String handleFileUpload(MultipartFile file) throws IOException {
        if (file != null && !file.isEmpty()) {
            // 获取原始文件名
            String originalFilename = file.getOriginalFilename();

            // 获取文件扩展名
            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));

            // 生成唯一文件名
            String newFilename = "/" + System.currentTimeMillis() + fileExtension;

            // 构建相对路径
            String relativePath = "/static/picture" + newFilename;

            // 获取绝对路径
            String absolutePath = servletContext.getRealPath(relativePath);

            // 确保目录存在
            File directory = new File(absolutePath).getParentFile();
            if (!directory.exists()) {
                directory.mkdirs();
            }

            // 保存文件
            File dest = new File(absolutePath);
            file.transferTo(dest);

            return relativePath;
        }
        // 返回默认图片路径或抛出异常
        throw new IOException("商品图片不能为空");
    }
}