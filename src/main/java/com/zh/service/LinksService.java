package com.zh.service;

import com.zh.pojo.Links;

import java.util.List;

public interface LinksService {

    List<Links> findAll();

    int deleteLinks(int lid);

    int addLinks(Links links);

    int updateLinks(Links links);
}
