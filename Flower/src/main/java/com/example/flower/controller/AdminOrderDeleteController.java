package com.example.flower.controller;

import com.example.flower.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/order_delete")
public class AdminOrderDeleteController {

    @Autowired
    private OrderService orderService;

    @GetMapping
    public String delete(@RequestParam("id") int id) {
        orderService.delete(id);
        return "redirect:/admin/order_list";
    }
}