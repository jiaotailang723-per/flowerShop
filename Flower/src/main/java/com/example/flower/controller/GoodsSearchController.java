package com.example.flower.controller;

import com.example.flower.model.Page;
import com.example.flower.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/flowers_search")
public class GoodsSearchController {

    @Autowired
    private GoodsService goodsService;

    @GetMapping
    public String search(@RequestParam("keyword") String keyword,
                         @RequestParam(value = "pageNumber", required = false, defaultValue = "1") int pageNumber,
                         Model model) {
        Page page = goodsService.getSearchGoodsPage(keyword, pageNumber);
        if (page.getTotalPage() == 0) {
            page.setTotalPage(1);
            page.setPageNumber(1);
        } else if (pageNumber >= page.getTotalPage() + 1) {
            page = goodsService.getSearchGoodsPage(keyword, page.getTotalPage());
        }
        model.addAttribute("p", page);
        model.addAttribute("keyword", keyword);
        return "flowers_search";
    }
}