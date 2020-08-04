package com.zh.service.impl;

import com.zh.mapper.StatisticsMapper;
import com.zh.pojo.Statistics;
import com.zh.service.StatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StatisticsServiceImpl implements StatisticsService {

    @Autowired
    private StatisticsMapper mapper;

    @Override
    public Statistics count() {
        return mapper.count();
    }
}
