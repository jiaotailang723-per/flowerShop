package com.example.flower.controller;

import com.example.flower.model.User;
import com.example.flower.service.UserService;
import com.example.flower.utils.PasswordUtils;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/user_changepwd")
public class UserChangePwdController {

    @Autowired
    private UserService userService;

    @PostMapping
    public String changePwd(@RequestParam("password") String password,
                            @RequestParam("newPassword") String newPassword,
                            HttpSession session,
                            Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            model.addAttribute("failMsg", "请先登录！");
            return "user_login";
        }
        
        // 验证原密码（比较加密后的密码）
        if (PasswordUtils.matches(password, user.getPassword())) {
            user.setPassword(newPassword);
            userService.updatePwd(user);
            // 更新session中的用户信息（密码已加密）
            session.setAttribute("user", userService.selectById(user.getId()));
            model.addAttribute("msg", "修改成功！");
            return "user_center";
        } else {
            model.addAttribute("failMsg", "修改失败，原密码不正确，你再想想！");
            return "user_center";
        }
    }
}