package com.zh.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.io.File;

@Configuration
public class MyMvcConfig implements WebMvcConfigurer {

    //系统文件分隔符
    String sepa = File.separator;

    /**
     * 解决文件回显显示的问题，设置虚拟目录映射
     *
     * 文件保存在真实目录/upload/下，
     * 访问的时候使用虚路径/upload，比如文件名为1.png，就直接/upload/1.png就ok了。
     * /upload/**：相当于别名
     * file:"+System.getProperty("user.dir")+"/upload/：本地文件路径
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/upload/**")
                .addResourceLocations("file:"+System.getProperty("user.dir")+"/upload/");
    }


}
