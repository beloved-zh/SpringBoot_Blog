package com.zh.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserBase implements Serializable {

    private String uid;
    private String userNo;
    private String userName;
    private String password;
    private String userPostbox;
    private String headSculpture;
    private String source;
    private Role role;

}
