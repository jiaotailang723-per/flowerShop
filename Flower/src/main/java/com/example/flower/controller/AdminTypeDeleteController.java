package com.example.flower.controller;

import com.example.flower.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/type_delete")
public class AdminTypeDeleteController {

    @Autowired
    private TypeService typeService;

    @GetMapping
    public String delete(@RequestParam("id") int id, RedirectAttributes redirectAttributes) {
        try {
            boolean isSuccess = typeService.delete(id);
            if (isSuccess) {
                redirectAttributes.addFlashAttribute("msg", "删除成功");
            } else {
                redirectAttributes.addFlashAttribute("failMsg", "类目下包含商品，无法删除");
            }
        } catch (DataIntegrityViolationException e) {
            redirectAttributes.addFlashAttribute("failMsg", "删除失败：类目下有商品存在");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("failMsg", "删除失败：" + e.getMessage());
        }
        return "redirect:/admin/type_list";
    }
}