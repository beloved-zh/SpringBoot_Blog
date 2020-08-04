package com.zh.mapper;

import com.zh.pojo.BingImage;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface BingImageMapper {

    int add(BingImage bingImage);

    List<BingImage> findAll();

    int delete(Integer bid);
}
