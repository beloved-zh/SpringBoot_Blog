package com.zh.mapper;

import com.zh.pojo.Tag;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface TagMapper {

    List<Tag> findAll();

    int addTag(Tag tag);

    int updateTag(Tag tag);

    int deleteTag(int tid);
}
