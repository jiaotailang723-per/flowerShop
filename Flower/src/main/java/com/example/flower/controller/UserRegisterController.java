package com.example.flower.controller;

import com.example.flower.model.User;
import com.example.flower.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user_register")
public class UserRegisterController {

    @Autowired
    private UserService userService;

    @GetMapping
    public String registerPage() {
        return "user_register";
    }

    @PostMapping
    public String register(
            @RequestParam("username") String username,
            @RequestParam("userphone") String userphone,
            @RequestParam("password") String password,
            Model model) {

        User user = new User();
        user.setUsername(username);
        user.setUserphone(userphone);
        user.setPassword(password);

        try {
            if (userService.register(user)) {
                model.addAttribute("msg", "注册成功，请登录！");
                return "user_login";
            } else {
                model.addAttribute("msg", "用户名或手机号码重复，请重新填写！");
                return "user_register";
            }
        } catch (Exception e) {
            model.addAttribute("msg", "注册失败: " + e.getMessage());
            return "user_register";
        }
    }
}