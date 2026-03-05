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
@RequestMapping("/admin/user_reset")
public class AdminUserResetController {

    @Autowired
    private UserService userService;

    // 显示密码重置表单 (GET)
    @GetMapping
    public String showResetForm(@RequestParam("id") int id, Model model) {
        User user = userService.selectById(id);
        model.addAttribute("user", user);
        return "admin/user_reset";
    }

    // 处理密码重置提交 (POST)
    @PostMapping
    public String resetPassword(@RequestParam("id") int id,
                                @RequestParam("password") String password) {
        User user = new User();
        user.setId(id);
        user.setPassword(password);
        userService.updatePwd(user);
        return "redirect:/admin/user_list";
    }
}