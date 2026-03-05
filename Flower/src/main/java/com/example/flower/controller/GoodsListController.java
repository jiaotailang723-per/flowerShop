package com.example.flower.controller;

import com.example.flower.model.Page;
import com.example.flower.model.Type;
import com.example.flower.service.GoodsService;
import com.example.flower.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/flowers_list")
public class GoodsListController {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private TypeService typeService;

    @GetMapping
    public String list(@RequestParam(value = "typeid", required = false, defaultValue = "0") int typeid,
                       @RequestParam(value = "pageNumber", required = false, defaultValue = "1") int pageNumber,
                       Model model) {
        Type type = null;
        if (typeid != 0) {
            type = typeService.selectTypeNameByID(typeid);
        }
        model.addAttribute("t", type);
        Page page = goodsService.selectPageByTypeID(typeid, pageNumber);
        if (page.getTotalPage() == 0) {
            page.setTotalPage(1);
            page.setPageNumber(1);
        } else if (pageNumber >= page.getTotalPage() + 1) {
            page = goodsService.selectPageByTypeID(typeid, page.getTotalPage());
        }
        model.addAttribute("p", page);
        model.addAttribute("id", String.valueOf(typeid));
        return "flowers_list";
    }

    @PostMapping
    public String doPost() {
        return "";
    }
}