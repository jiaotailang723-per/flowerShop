package com.example.flower.controller;

import com.example.flower.model.User;
import com.example.flower.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/user_login")
public class UserLoginController {

    @Autowired
    private UserService userService;

    // 处理 GET 请求，返回登录页面
    @GetMapping
    public String loginPage() {
        return "user_login";
    }

    @PostMapping
    public String login(
            @RequestParam String ue,
            @RequestParam String password,
            HttpSession session,
            Model model
    ) {
        User user = userService.login(ue, password);
        if (user != null) {
            session.setAttribute("user", user);
            return "redirect:/index";
        } else {
            model.addAttribute("failMsg", "用户名或密码错误");
            return "user_login";
        }
    }
}