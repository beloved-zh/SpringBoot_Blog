package com.zh.controller.reception;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zh.pojo.BingImage;
import com.zh.service.BingImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/bingImage")
public class BingImageController {

    @Autowired
    private BingImageService service;


    @PostMapping("/findAll")
    @ResponseBody
    public PageInfo findAll(Integer pageNum){
        PageHelper.startPage(pageNum, 16);
        List<BingImage> list = service.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @RequestMapping("/gotoBingImage")
    public String gotoBingImage(){
        return "reception/bingImage";
    }
}
