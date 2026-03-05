package com.example.flower.controller;

import com.example.flower.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/user_delete")
public class AdminUserDeleteController {

    @Autowired
    private UserService userService;

    @GetMapping
    public String delete(@RequestParam("id") int id, RedirectAttributes redirectAttributes) {
        try {
            boolean isSuccess = userService.delete(id);
            if (isSuccess) {
                redirectAttributes.addFlashAttribute("msg", "客户删除成功");
            } else {
                redirectAttributes.addFlashAttribute("failMsg", "客户有订单，请先删除订单");
            }
        } catch (DataIntegrityViolationException e) {
            redirectAttributes.addFlashAttribute("failMsg", "删除失败：客户有未完成订单");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("failMsg", "删除失败：" + e.getMessage());
        }
        return "redirect:/admin/user_list";
    }
}