package com.zh.service;

import com.zh.pojo.Tag;

import java.util.List;

public interface TagService {

    List<Tag> findAll();

    int addTag(Tag tag);

    int updateTag(Tag tag);

    int deleteTag(int tid);
}
