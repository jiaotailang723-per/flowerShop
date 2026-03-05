package com.example.flower.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order_submit")
public class OrderSubmitController {

    @GetMapping
    public String submit(HttpSession session, Model model) {
        if (session.getAttribute("user") != null) {
            return "order_submit";
        } else {
            model.addAttribute("failMsg", "请登录后，再提交订单！");
            return "user_login";
        }
    }
}