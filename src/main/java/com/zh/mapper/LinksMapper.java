package com.zh.mapper;

import com.zh.pojo.Links;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface LinksMapper {

    List<Links> findAll();

    int deleteLinks(int lid);

    int addLinks(Links links);

    int updateLinks(Links links);
}
