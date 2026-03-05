package com.example.flower.controller;

import com.example.flower.model.User;
import com.example.flower.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user_changeaddress")
public class UserChangeAddressController {

    @Autowired
    private UserService userService;

    @PostMapping
    public String changeAddress(
            @RequestParam("name") String name,
            @RequestParam("phone") String phone,
            @RequestParam("address") String address,
            HttpSession session,
            Model model) {

        User loginUser = (User) session.getAttribute("user");
        if (loginUser == null) {
            model.addAttribute("failMsg", "请先登录！");
            return "user_login";
        }
        try {
            loginUser.setName(name);
            loginUser.setPhone(phone);
            loginUser.setAddress(address);
            userService.updateUserAddress(loginUser);
            model.addAttribute("msg", "收件信息更新成功！");
            return "user_center";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("failMsg", "更新失败，请稍后重试！");
            return "user_center";
        }
    }
}