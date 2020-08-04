package com.zh.controller.reception;

import com.zh.pojo.Links;
import com.zh.service.LinksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/links")
public class LinksController {

    @Autowired
    private LinksService linksService;

    @PostMapping("/findAll")
    @ResponseBody
    public List<Links> findAll(){
        List<Links> list = linksService.findAll();
        return list;
    }

}
