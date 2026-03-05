package com.example.flower.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HeaderController {

    @GetMapping("/user_center")
    public String userCenter(){
        return "user_center";
    }

    @GetMapping("/admin/index")
    public String adminIndex(){
        return "admin/index";
    }

    @GetMapping("/flowers_cart")
    public String flowersCart(){
        return "flowers_cart";
    }

}
