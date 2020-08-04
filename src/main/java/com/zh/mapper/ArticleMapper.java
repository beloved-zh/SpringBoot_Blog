package com.zh.mapper;

import com.zh.pojo.Article;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ArticleMapper {

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
