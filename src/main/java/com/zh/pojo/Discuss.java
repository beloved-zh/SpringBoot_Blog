package com.zh.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Discuss {

    private int did;
    private String comments;
    private Date time;
    private UserBase userBase;
    private Article article;

}
