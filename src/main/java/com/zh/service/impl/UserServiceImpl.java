package com.zh.service.impl;

import com.zh.mapper.UserMapper;
import com.zh.pojo.UserBase;
import com.zh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper mapper;

    @Override
    public UserBase login(String userNo, String password) {
        return mapper.login(userNo, password);
    }

    @Override
    public UserBase getUserLoginInfo(String userNo) {
        return mapper.getUserLoginInfo(userNo);
    }
}
