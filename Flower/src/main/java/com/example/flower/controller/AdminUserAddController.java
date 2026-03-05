package com.example.flower.controller;

import com.example.flower.model.User;
import com.example.flower.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/user_add")
public class AdminUserAddController {

    @Autowired
    private UserService userService;

    // 显示添加表单 (GET)
    @GetMapping
    public String showAddForm(Model model) {
        model.addAttribute("u", new User()); // 空用户对象用于表单绑定
        return "admin/user_add";
    }

    // 处理表单提交 (POST)
    @PostMapping
    public String add(
            @ModelAttribute("u") User user,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes) {

        if (bindingResult.hasErrors()) {
            return "admin/user_add";
        }

        if (userService.register(user)) {
            redirectAttributes.addFlashAttribute("msg", "客户添加成功！");
        } else {
            redirectAttributes.addFlashAttribute("failMsg", "用户名或手机号码重复，请重新填写！");
        }

        return "redirect:/admin/user_list";
    }
}