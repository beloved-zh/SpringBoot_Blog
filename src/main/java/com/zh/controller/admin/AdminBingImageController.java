package com.zh.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zh.pojo.BingImage;
import com.zh.service.BingImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/bingImage")
public class AdminBingImageController {

    @Autowired
    private BingImageService service;

    @GetMapping("/delete/{bid}")
    public String delete(@PathVariable("bid") Integer bid){
        service.delete(bid);
        return "redirect:/admin/bingImage/gotoBingImage";
    }

    @PostMapping("/findAll")
    @ResponseBody
    public PageInfo findAll(Integer pageNum){
        PageHelper.startPage(pageNum, 10);
        List<BingImage> list = service.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @RequestMapping("/gotoBingImage")
    public String gotoBingImage(){
        return "admin/bingImage";
    }
}
