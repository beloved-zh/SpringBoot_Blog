package com.zh.controller.reception;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zh.pojo.Article;
import com.zh.pojo.Classify;
import com.zh.service.ArticleService;
import com.zh.service.ClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class MyController {

    @Autowired
    private ClassifyService classifyService;

    @GetMapping("/")
    public String index(Model model){

        List<Classify> cList = classifyService.findAll();

        model.addAttribute("cList",cList);

        return "reception/index";
    }

    /*@PostMapping("/")
    @ResponseBody
    public String findByClassifyArticle(Model model){

        List<Classify> cList = classifyService.findAll();

        model.addAttribute("cList",cList);

        return "reception/index";
    }*/
}
