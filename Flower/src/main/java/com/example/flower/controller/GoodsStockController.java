package com.example.flower.controller;

import com.example.flower.model.Goods;
import com.example.flower.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/goods_stock")
public class GoodsStockController {

    @Autowired
    private GoodsService goodsService;

    @GetMapping
    @ResponseBody
    public String getStock(@RequestParam("goodsid") int goodsid) {
        Goods goods = goodsService.getGoodsById(goodsid);
        if (goods == null) {
            return "0";
        }
        return String.valueOf(goods.getStock());
    }
}

