package com.example.flower.controller;

import com.example.flower.model.Goods;
import com.example.flower.model.Order;
import com.example.flower.model.OrderItem;
import com.example.flower.model.User;
import com.example.flower.service.GoodsService;
import com.example.flower.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping("/order_confirm")
public class OrderConfirmController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private GoodsService goodsService;

    @PostMapping
    public String confirm(
            @RequestParam("name") String name,
            @RequestParam("phone") String phone,
            @RequestParam("address") String address,
            @RequestParam("paytype") int payType, // 添加支付方式参数
            HttpSession session,
            Model model) {

        Order order = (Order) session.getAttribute("order");
        if (order == null || order.getTotal() <= 0) {
            model.addAttribute("failMsg", "订单无效或已过期");
            return "order_submit";
        }

        // 检查所有商品的库存
        Map<Integer, OrderItem> itemMap = order.getItemMap();
        for (Map.Entry<Integer, OrderItem> entry : itemMap.entrySet()) {
            int goodsId = entry.getKey();
            OrderItem item = entry.getValue();
            Goods goods = goodsService.getGoodsById(goodsId);
            
            if (goods == null) {
                model.addAttribute("failMsg", "商品不存在或已下架");
                return "order_submit";
            }
            
            // 检查购买数量是否超过库存
            if (item.getAmount() > goods.getStock()) {
                model.addAttribute("failMsg", 
                    String.format("商品【%s】的购买数量(%d)超过库存数量(%d)，请调整购买数量后重新提交！", 
                        goods.getName(), item.getAmount(), goods.getStock()));
                return "order_submit";
            }
            
            // 检查库存是否充足
            if (goods.getStock() <= 0) {
                model.addAttribute("failMsg", 
                    String.format("商品【%s】库存不足，无法购买！", goods.getName()));
                return "order_submit";
            }
        }

        // 设置订单信息
        order.setName(name);
        order.setPhone(phone);
        order.setAddress(address);
        order.setDatetime(new Date());
        order.setStatus(2);// 设置支付状态 暂时默认2 已付款
        order.setPaytype(payType); // 设置支付方式

        // 关联用户
        User user = (User) session.getAttribute("user");
        if (user != null) {
            order.setUser(user);
        }

        // 保存订单
        try {
            orderService.addOrder(order);
            session.removeAttribute("order");
            model.addAttribute("order", order);
            return "order_success"; // 跳转到成功页面
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("failMsg", "订单提交失败，请稍后重试");
            return "order_submit";
        }
    }
}