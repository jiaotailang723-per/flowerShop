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
@RequestMapping("/admin/user_edit")
public class AdminUserEditController {

    @Autowired
    private UserService userService;

    // 添加 GET 方法用于展示编辑表单
    @GetMapping
    public String showEditForm(@RequestParam("id") int id, Model model) {
        User user = userService.selectById(id);
        model.addAttribute("u", user);
        return "admin/user_edit";
    }

    // 原有的 POST 方法处理提交
    @PostMapping
    public String edit(@RequestParam("id") int id,
                       @RequestParam("name") String name,
                       @RequestParam("phone") String phone,
                       @RequestParam("address") String address) {
        User user = new User();
        user.setId(id);
        user.setName(name);
        user.setPhone(phone);
        user.setAddress(address);
        userService.updateUserAddress(user);
        return "redirect:/admin/user_list";
    }
}