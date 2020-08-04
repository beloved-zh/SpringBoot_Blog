package com.zh.service;

import com.zh.pojo.Article;

import java.util.List;

public interface ArticleService {

    int addArticle(Article article);

    List<Article> findByState(int state);

    int deleteArticle(int aid);

    List<Article> fuzzyQuery(String tag);

    Article findById(int aid);

    int updateArticle(Article article);

    List<Article> findAllByState();

    List<Article> findByClassify(int cid);

    List<Article> findByTag(String tag);

    Article findByIdAndState(int aid);

    int updatePageviews(int aid);

    List<Article> search(String name);

    List<Article> popular();
}
