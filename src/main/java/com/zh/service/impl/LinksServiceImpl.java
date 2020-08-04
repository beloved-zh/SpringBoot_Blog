package com.zh.service.impl;

import com.zh.mapper.LinksMapper;
import com.zh.pojo.Links;
import com.zh.service.LinksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LinksServiceImpl implements LinksService {

    @Autowired
    private LinksMapper mapper;

    @Override
    public List<Links> findAll() {
        return mapper.findAll();
    }

    @Override
    public int deleteLinks(int lid) {
        return mapper.deleteLinks(lid);
    }

    @Override
    public int addLinks(Links links) {
        return mapper.addLinks(links);
    }

    @Override
    public int updateLinks(Links links) {
        return mapper.updateLinks(links);
    }
}
