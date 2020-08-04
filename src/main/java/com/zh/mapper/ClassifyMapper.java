package com.zh.mapper;

import com.zh.pojo.Classify;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ClassifyMapper {

    List<Classify> findAll();

    int addClassify(Classify classify);

    int updateClassify(Classify classify);

    int deleteClassify(int cid);

}
