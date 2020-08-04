package com.zh.controller.reception;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zh.pojo.Article;
import com.zh.pojo.Classify;
import com.zh.service.ArticleService;
import com.zh.service.ClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;
    @Autowired
    private ClassifyService classifyService;

    @PostMapping("/findByClassify")
    @ResponseBody
    public PageInfo findByClassify(int pageNum,int cid){
        PageHelper.startPage(pageNum, 10);
        List<Article> list = articleService.findByClassify(cid);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @PostMapping("/findByTag")
    @ResponseBody
    public PageInfo findByTag(int pageNum,String tag){
        tag = "%"+tag+"%";
        PageHelper.startPage(pageNum, 10);
        List<Article> list = articleService.findByTag(tag);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @PostMapping("/findAllByState")
    @ResponseBody
    public PageInfo findAllByState(Integer pageNum){
        PageHelper.startPage(pageNum, 10);
        List<Article> list = articleService.findAllByState();
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @GetMapping("/lookArticle/{aid}")
    public String lookArticle(@PathVariable("aid") Integer aid, Model model){

        articleService.updatePageviews(aid);

        Article article = articleService.findByIdAndState(aid);

        model.addAttribute("article",article);

        List<Classify> cList = classifyService.findAll();

        model.addAttribute("cList",cList);

        return "reception/article_details";
    }

    @PostMapping("/search")
    @ResponseBody
    public PageInfo search(Integer pageNum,String name){
        name = "%"+name+"%";
        PageHelper.startPage(pageNum, 10);
        List<Article> list = articleService.search(name);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @PostMapping("/popular")
    @ResponseBody
    public List<Article> popular(){

        List<Article> list = articleService.popular();

        return list;
    }
}
