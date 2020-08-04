package com.zh.service;

import com.zh.pojo.UserBase;

public interface UserService {

    UserBase login(String userNo, String password);

    UserBase getUserLoginInfo(String userNo);
}
