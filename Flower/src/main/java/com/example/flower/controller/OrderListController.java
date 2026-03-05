package com.example.flower.controller;

import com.example.flower.model.User;
import com.example.flower.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order_list")
public class OrderListController {

    @Autowired
    private OrderService orderService;

    @GetMapping
    public String list(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/index";
        }
        model.addAttribute("orderList", orderService.selectAll(user.getId()));
        return "order_list";
    }
}