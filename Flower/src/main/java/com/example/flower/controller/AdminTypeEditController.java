package com.example.flower.controller;

import com.example.flower.model.Type;
import com.example.flower.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/type_edit")
public class AdminTypeEditController {

    @Autowired
    private TypeService typeService;

    // 添加 GET 映射用于显示编辑表单
    @GetMapping
    public String editForm(@RequestParam("id") int id, Model model) {
        Type type = typeService.select(id);
        model.addAttribute("type", type);
        return "admin/type_edit";
    }

    // 处理表单提交的 POST 请求
    @PostMapping
    public String editSubmit(@RequestParam("id") int id,
                             @RequestParam("name") String name) {
        Type type = new Type();
        type.setId(id);
        type.setName(name);
        typeService.update(type);
        return "redirect:/admin/type_list";
    }
}