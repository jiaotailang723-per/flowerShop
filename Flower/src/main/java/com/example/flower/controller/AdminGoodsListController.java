package com.example.flower.controller;

import com.example.flower.model.Page;
import com.example.flower.service.GoodsService;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/goods_list")
public class AdminGoodsListController {

    @Autowired
    private GoodsService goodsService;

    @GetMapping
    public String list(@RequestParam(value = "type", required = false, defaultValue = "0") int type,
                       @RequestParam(value = "pageNumber", required = false, defaultValue = "1") int pageNumber,
                       @RequestParam(value = "t", required = false) String timestamp,
                       Model model,
                       HttpServletResponse response) {

        // 设置响应头禁用缓存
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setDateHeader("Expires", 0); // Proxies

        // 从重定向属性中获取消息
        if (model.containsAttribute("successMsg")) {
            model.addAttribute("successMsg", model.getAttribute("successMsg"));
        }

        Page page = goodsService.getGoodsRecommendPage(type, pageNumber);
        if (page.getTotalPage() == 0) {
            page.setTotalPage(1);
            page.setPageNumber(1);
        } else if (pageNumber >= page.getTotalPage() + 1) {
            page = goodsService.getGoodsRecommendPage(type, page.getTotalPage());
        }
        model.addAttribute("p", page);
        model.addAttribute("type", type);
        return "admin/goods_list";
    }
}