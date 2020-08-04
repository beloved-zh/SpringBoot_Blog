package com.zh.service;

import com.zh.pojo.BingImage;

import java.util.List;

public interface BingImageService {

    int add();

    List<BingImage> findAll();

    int delete(Integer bid);
}
