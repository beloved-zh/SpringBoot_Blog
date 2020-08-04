package com.zh;

import com.zh.service.impl.UserServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
class BlogApplicationTests {

    @Autowired
    private UserServiceImpl userServiceImpl;

    @Test
    void contextLoads() {
        String s = "abc(def";
        String s1 = s.substring(0,s.indexOf("("));
        System.out.println(s1);
    }

}
