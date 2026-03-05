package com.example.flower.controller;

import com.example.flower.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/order_status")
public class AdminOrderStatusController {

    @Autowired
    private OrderService orderService;

    @GetMapping
    public String status(@RequestParam("id") int id,
                         @RequestParam("status") int status) {
        orderService.updateStatus(id, status);
        return "redirect:/admin/order_list?status=" + status;
    }
}