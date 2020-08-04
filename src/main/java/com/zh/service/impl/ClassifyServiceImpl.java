package com.zh.service.impl;

import com.zh.mapper.ClassifyMapper;
import com.zh.pojo.Classify;
import com.zh.service.ClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassifyServiceImpl implements ClassifyService {

    @Autowired
    private ClassifyMapper mapper;

    @Override
    public List<Classify> findAll() {
        return mapper.findAll();
    }

    @Override
    public int addClassify(Classify classify) {
        return mapper.addClassify(classify);
    }

    @Override
    public int updateClassify(Classify classify) {
        return mapper.updateClassify(classify);
    }

    @Override
    public int deleteClassify(int cid) {
        return mapper.deleteClassify(cid);
    }
}
