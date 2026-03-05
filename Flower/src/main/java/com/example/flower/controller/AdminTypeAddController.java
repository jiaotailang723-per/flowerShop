package com.example.flower.controller;

import com.example.flower.model.Type;
import com.example.flower.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/type_add")
public class AdminTypeAddController {

    @Autowired
    private TypeService typeService;

    @PostMapping
    public String add(@RequestParam("name") String name) {
        typeService.insert(new Type(name));
        return "redirect:/admin/type_list";
    }
}