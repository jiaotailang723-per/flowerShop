package com.example.flower.controller;

import com.example.flower.model.Page;
import com.example.flower.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/user_list")
public class AdminUserListController {

    @Autowired
    private UserService userService;

    @GetMapping
    public String list(@RequestParam(value = "pageNumber", required = false, defaultValue = "1") int pageNumber,
                       Model model) {
        Page page = userService.getUserPage(pageNumber);
        if (page.getTotalPage() == 0) {
            page.setTotalPage(1);
            page.setPageNumber(1);
        } else if (pageNumber >= page.getTotalPage() + 1) {
            page = userService.getUserPage(page.getTotalPage());
        }
        model.addAttribute("p", page);
        return "admin/user_list";
    }
}