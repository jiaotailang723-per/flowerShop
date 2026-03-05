package com.example.flower.controller;

import com.example.flower.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/type_list")
public class AdminTypeListController {

    @Autowired
    private TypeService typeService;

    @GetMapping
    public String list(Model model) {
        model.addAttribute("list", typeService.getAllType());
        model.addAttribute("typeList", typeService.getAllType());
        return "admin/type_list";
    }
}