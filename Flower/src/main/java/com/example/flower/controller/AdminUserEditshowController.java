package com.example.flower.controller;

import com.example.flower.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/user_editshow")
public class AdminUserEditshowController {

    @Autowired
    private UserService userService;

    @GetMapping
    public String show(@RequestParam("id") int id, Model model) {
        model.addAttribute("u", userService.selectById(id));
        return "admin/user_edit";
    }
}