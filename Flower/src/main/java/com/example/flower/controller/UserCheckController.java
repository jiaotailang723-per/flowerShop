package com.example.flower.controller;

import com.example.flower.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user_check")
public class UserCheckController {

    @Autowired
    private UserService userService;

    @GetMapping(value = "/username", produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    public String checkUsername(@RequestParam("username") String username) {
        try {
            if (userService.isUsernameExist(username)) {
                return "exist";
            }
            return "available";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @GetMapping(value = "/userphone", produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody
    public String checkUserphone(@RequestParam("userphone") String userphone) {
        try {
            if (userService.isUserphoneExist(userphone)) {
                return "exist";
            }
            return "available";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
}

