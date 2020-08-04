package com.zh.service.impl;

import com.zh.mapper.ArticleMapper;
import com.zh.pojo.Article;
import com.zh.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper mapper;

    @Override
    public int addArticle(Article article) {
        return mapper.addArticle(article);
    }

    @Override
    public List<Article> findByState(int state) {
        return mapper.findByState(state);
    }

    @Override
    public int deleteArticle(int aid) {
        return mapper.deleteArticle(aid);
    }

    @Override
    public List<Article> fuzzyQuery(String tag) {

        tag = "%"+tag+"%";

        return mapper.fuzzyQuery(tag);
    }

    @Override
    public Article findById(int aid) {
        return mapper.findById(aid);
    }

    @Override
    public int updateArticle(Article article) {
        return mapper.updateArticle(article);
    }

    @Override
    public List<Article> findAllByState() {
        return mapper.findAllByState();
    }

    @Override
    public List<Article> findByClassify(int cid) {
        return mapper.findByClassify(cid);
    }

    @Override
    public List<Article> findByTag(String tag) {
        return mapper.findByTag(tag);
    }

    @Override
    public Article findByIdAndState(int aid) {
        return mapper.findByIdAndState(aid);
    }

    @Override
    public int updatePageviews(int aid) {
        return mapper.updatePageviews(aid);
    }

    @Override
    public List<Article> search(String name) {
        return mapper.search(name);
    }

    @Override
    public List<Article> popular() {
        return mapper.popular();
    }
}
