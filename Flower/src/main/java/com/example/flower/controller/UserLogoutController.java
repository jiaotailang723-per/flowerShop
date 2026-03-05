package com.example.flower.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/user_logout")
public class UserLogoutController {

    @GetMapping
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/index";
    }
}