package com.example.flower.controller;

import com.example.flower.model.Page;
import com.example.flower.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/order_list")
public class AdminOrderListController {

    @Autowired
    private OrderService orderService;

    @GetMapping
    public String list(@RequestParam(value = "status", required = false, defaultValue = "0") int status,
                       @RequestParam(value = "pageNumber", required = false, defaultValue = "1") int pageNumber,
                       Model model) {
        Page page = orderService.getOrderPage(status, pageNumber);
        if (page.getTotalPage() == 0) {
            page.setTotalPage(1);
            page.setPageNumber(1);
        } else if (pageNumber >= page.getTotalPage() + 1) {
            page = orderService.getOrderPage(status, page.getTotalPage());
        }
        model.addAttribute("p", page);
        model.addAttribute("status", status);
        return "admin/order_list";
    }
}