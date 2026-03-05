package com.example.flower.controller;

import com.example.flower.model.Goods;
import com.example.flower.service.GoodsService;
import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;

@Controller
@RequestMapping("/admin/goods_edit")
public class AdminGoodsEditController {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private ServletContext servletContext;

    @PostMapping
    public String edit(@RequestParam("id") int id,
                       @RequestParam("name") String name,
                       @RequestParam("price") float price,
                       @RequestParam("intro") String intro,
                       @RequestParam(value = "cover", required = false) MultipartFile coverFile,
                       @RequestParam(value = "image1", required = false) MultipartFile image1File,
                       @RequestParam(value = "image2", required = false) MultipartFile image2File,
                       @RequestParam("stock") int stock,
                       @RequestParam("typeid") int typeid,
                       @RequestParam("pageNumber") int pageNumber,
                       @RequestParam("type") int type,
                       @RequestParam("oldCover") String oldCover, // 添加原有封面路径
                       @RequestParam("oldImage1") String oldImage1, // 添加原有图片1路径
                       @RequestParam("oldImage2") String oldImage2) { // 添加原有图片2路径

        Goods goods = new Goods();
        goods.setId(id);
        goods.setName(name);
        goods.setPrice(price);
        goods.setIntro(intro);
        goods.setStock(stock);
        goods.setTypeid(typeid);

        // 处理文件上传 - 使用新方法处理
        goods.setCover(handleFileUpload(coverFile, oldCover));
        goods.setImage1(handleFileUpload(image1File, oldImage1));
        goods.setImage2(handleFileUpload(image2File, oldImage2));

        goodsService.update(goods);
        return "redirect:/admin/goods_list?pageNumber=" + pageNumber + "&type=" + type;
    }

    private String handleFileUpload(MultipartFile file, String currentPath) {
        if (file != null && !file.isEmpty()) {
            try {
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
            } catch (IOException e) {
                e.printStackTrace();
                // 上传失败时返回原有路径
                return currentPath;
            }
        }
        // 没有上传新文件时返回原有路径
        return currentPath;
    }
}