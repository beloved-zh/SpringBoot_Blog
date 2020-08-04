package com.zh.mapper;

import com.zh.pojo.Statistics;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface StatisticsMapper {

    Statistics count();

}
