package com.zh.controller.admin;

import com.zh.pojo.Classify;
import com.zh.pojo.Tag;
import com.zh.service.ClassifyService;
import com.zh.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/tag")
public class AdminTagController {

    @Autowired
    private TagService tagService;

    @PostMapping("/add")
    public String add(Tag tag){
        tagService.addTag(tag);
        return "redirect:/admin/gotoCategory_label";
    }


    @PostMapping("/update")
    public String update(Tag tag){
        tagService.updateTag(tag);
        return "redirect:/admin/gotoCategory_label";
    }

    @GetMapping("/delete/{tid}")
    public String delete(@PathVariable("tid") int tid){
        tagService.deleteTag(tid);
        return "redirect:/admin/gotoCategory_label";
    }
}
