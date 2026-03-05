package com.example.flower.controller;

import com.example.flower.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/goods_delete")
public class AdminGoodsDeleteController {

    @Autowired
    private GoodsService goodsService;

    @GetMapping
    public String delete(@RequestParam("id") int id,
                         @RequestParam("pageNumber") int pageNumber,
                         @RequestParam("type") int type,
                         RedirectAttributes redirectAttributes) {
        boolean isSuccess = goodsService.delete(id);
        if (isSuccess) {
            redirectAttributes.addFlashAttribute("successMsg", "商品删除成功");
        } else {
            redirectAttributes.addFlashAttribute("failMsg", "商品删除失败，请先删除关联的订单");
        }
        return "redirect:/admin/goods_list?pageNumber=" + pageNumber + "&type=" + type;
    }
}