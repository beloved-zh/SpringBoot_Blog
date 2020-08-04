package com.zh.service.impl;

import com.zh.mapper.BingImageMapper;
import com.zh.pojo.BingImage;
import com.zh.service.BingImageService;
import com.zh.utils.BingImageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BingImageServiceImpl implements BingImageService {

    @Autowired
    private BingImageMapper mapper;
    @Autowired
    private BingImageUtils bingImageUtils;

    //定时任务  防止bing服务器更新延迟 每天0点10分更新
    @Scheduled(cron = "0 10 00 * * ?")
    @Override
    public int add() {
        BingImage bingImage = bingImageUtils.getImage();
        return mapper.add(bingImage);
    }

    @Override
    public List<BingImage> findAll() {
        return mapper.findAll();
    }

    @Override
    public int delete(Integer bid) {
        return mapper.delete(bid);
    }
}
