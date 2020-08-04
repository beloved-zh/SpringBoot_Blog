package com.zh.controller.reception;

import com.zh.pojo.Tag;
import com.zh.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/tag")
public class TagController {

    @Autowired
    private TagService tagService;

    @PostMapping("/findAll")
    @ResponseBody
    public List<Tag> findAll(){

        List<Tag> list = tagService.findAll();

        return list;
    }

}
