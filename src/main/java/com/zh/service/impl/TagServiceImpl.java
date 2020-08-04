package com.zh.service.impl;

import com.zh.mapper.TagMapper;
import com.zh.pojo.Tag;
import com.zh.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TagServiceImpl implements TagService {

    @Autowired
    private TagMapper mapper;

    @Override
    public List<Tag> findAll() {
        return mapper.findAll();
    }

    @Override
    public int addTag(Tag tag) {
        return mapper.addTag(tag);
    }

    @Override
    public int updateTag(Tag tag) {
        return mapper.updateTag(tag);
    }

    @Override
    public int deleteTag(int tid) {
        return mapper.deleteTag(tid);
    }
}
