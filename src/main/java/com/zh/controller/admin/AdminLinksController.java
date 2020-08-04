package com.zh.controller.admin;

import com.zh.pojo.Links;
import com.zh.service.LinksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin/links")
public class AdminLinksController {

    @Autowired
    private LinksService linksService;

    @RequestMapping("/gotoLinks")
    public String gotoLink(Model model){
        List<Links> list = linksService.findAll();
        model.addAttribute("list",list);
        return "admin/links";
    }

    @GetMapping("/deleteLinks/{lid}")
    public String deleteLinks(@PathVariable("lid") int lid){
        linksService.deleteLinks(lid);
        return "redirect:/admin/links/gotoLinks";
    }

    @PostMapping("/addLinks")
    public String addLinks(Links links){
        linksService.addLinks(links);
        return "redirect:/admin/links/gotoLinks";
    }

    @PostMapping("/updateLinks")
    public String updateLinks(Links links){
        linksService.updateLinks(links);
        return "redirect:/admin/links/gotoLinks";
    }
}
