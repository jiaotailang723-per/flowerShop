package com.example.flower.controller;

import com.example.flower.model.Order;
import com.example.flower.model.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/flowers_lessen")
public class GoodsLessenController {

    @PostMapping
    @ResponseBody
    public String lessen(@RequestParam("goodsid") int goodsid, HttpSession session) {
        // 检查用户是否登录
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "login";
        }

        Order order = (Order) session.getAttribute("order");
        if (order == null) {
            order = new Order();
            session.setAttribute("order", order);
        }
        order.lessen(goodsid);
        return "ok";
    }
}