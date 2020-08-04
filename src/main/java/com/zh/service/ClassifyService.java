package com.zh.service;

import com.zh.pojo.Classify;

import java.util.List;

public interface ClassifyService {

    List<Classify> findAll();

    int addClassify(Classify classify);

    int updateClassify(Classify classify);

    int deleteClassify(int cid);

}
