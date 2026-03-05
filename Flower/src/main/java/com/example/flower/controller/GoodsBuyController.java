package com.example.flower.controller;

import com.example.flower.model.Goods;
import com.example.flower.model.Order;
import com.example.flower.model.OrderItem;
import com.example.flower.model.User;
import com.example.flower.service.GoodsService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/goods_buy")
public class GoodsBuyController {

    @Autowired
    private GoodsService goodsService;

    @PostMapping
    @ResponseBody
    public String buy(@RequestParam("goodsid") int goodsid, HttpSession session) {
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

        Goods goods = goodsService.getGoodsById(goodsid);
        if (goods == null) {
            return "fail";
        }

        // 检查库存
        int currentAmount = 0;
        if (order.getItemMap().containsKey(goodsid)) {
            OrderItem existingItem = order.getItemMap().get(goodsid);
            currentAmount = existingItem.getAmount();
        }

        // 检查增加后是否超过库存
        if (currentAmount + 1 > goods.getStock()) {
            return "stock_insufficient:" + goods.getStock();
        }

        // 检查库存是否充足
        if (goods.getStock() <= 0) {
            return "stock_empty";
        }

        order.addGoods(goods);
        return "ok";
    }
}