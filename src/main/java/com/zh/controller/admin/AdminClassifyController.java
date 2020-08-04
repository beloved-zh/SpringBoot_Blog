package com.zh.controller.admin;

import com.zh.pojo.Classify;
import com.zh.service.ClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/classify")
public class AdminClassifyController {

    @Autowired
    private ClassifyService classifyService;

    @PostMapping("/add")
    public String add(Classify classify){
        classifyService.addClassify(classify);
        return "redirect:/admin/gotoCategory_label";
    }


    @PostMapping("/update")
    public String update(Classify classify){
        classifyService.updateClassify(classify);
        return "redirect:/admin/gotoCategory_label";
    }

    @GetMapping("/delete/{cid}")
    public String delete(@PathVariable("cid") int cid){
        classifyService.deleteClassify(cid);
        return "redirect:/admin/gotoCategory_label";
    }
}
