package com.example.flower.controller;

import com.example.flower.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/goods_recommend")
public class AdminGoodsRecommendController {

    @Autowired
    private GoodsService goodsService;

    @GetMapping
    public String recommend(@RequestParam("id") int id,
                            @RequestParam("method") String method,
                            @RequestParam("typeTarget") int typeTarget) {
        if ("add".equals(method)) {
            goodsService.addRecommend(id, typeTarget);
        } else {
            goodsService.removeRecommend(id, typeTarget);
        }
        return "redirect:/admin/goods_list";
    }
}