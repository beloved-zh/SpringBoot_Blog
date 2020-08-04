package com.zh.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 统计数据实体类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Statistics {

    //用户数
    private int userNumber;
    //文章数
    private int articleNumber;
    //评论数
    private int discussNumber;
    //分类数
    private int classifyNumber;
    //标签数
    private int tagNumber;
    //美图数
    private int bingImageNumber;


}
