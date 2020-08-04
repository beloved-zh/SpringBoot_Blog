package com.zh.controller.admin;

import com.zh.pojo.Classify;
import com.zh.pojo.Statistics;
import com.zh.pojo.Tag;
import com.zh.service.ArticleService;
import com.zh.service.ClassifyService;
import com.zh.service.StatisticsService;
import com.zh.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private StatisticsService statisticsService;
    @Autowired
    private ClassifyService classifyService;
    @Autowired
    private TagService tagService;


    @RequestMapping("/gotoLogin")
    public String login(){
        return "admin/login";
    }

    @RequestMapping("/gotoHome")
    public String gotoHome(Model model){

        Statistics count = statisticsService.count();

        model.addAttribute("count",count);
        return "admin/home";
    }

    @RequestMapping("/gotoCategory_label")
    public String gotoCategory_label(Model model){

        List<Classify> cList = classifyService.findAll();
        List<Tag> tList = tagService.findAll();

        model.addAttribute("cList",cList);
        model.addAttribute("tList",tList);

        return "admin/category_label";
    }

}
