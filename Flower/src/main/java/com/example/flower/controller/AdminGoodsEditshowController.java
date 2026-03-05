package com.example.flower.controller;

import com.example.flower.model.Goods;
import com.example.flower.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/goods_editshow")
public class AdminGoodsEditshowController {

    @Autowired
    private GoodsService goodsService;

    @GetMapping
    public String show(@RequestParam("id") int id, Model model) {
        Goods goods = goodsService.getGoodsById(id);
        model.addAttribute("g", goods);
        return "admin/goods_edit";
    }
}