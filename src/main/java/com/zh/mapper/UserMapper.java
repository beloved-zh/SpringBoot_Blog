package com.zh.mapper;

import com.zh.pojo.UserBase;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserMapper {

    UserBase login(String userNo,String password);

    UserBase getUserLoginInfo(String userNo);
}
