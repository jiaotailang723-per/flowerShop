package com.example.flower.controller;

import com.example.flower.service.GoodsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class IndexController {
    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

    @Autowired
    private GoodsService goodsService;

    @GetMapping({"/", "/index"})
    public String index(Model model) {
        // 获取轮播商品
        List<Map<String, Object>> scrollGoods = goodsService.getScrollGood();
        model.addAttribute("scroll", scrollGoods);

        // 获取新品推荐
        List<Map<String, Object>> newList = goodsService.getGoodsList(3);
        model.addAttribute("newList", newList);

        // 获取热销推荐
        List<Map<String, Object>> hotList = goodsService.getGoodsList(2);
        model.addAttribute("hotList", hotList);

        return "index";
    }
}