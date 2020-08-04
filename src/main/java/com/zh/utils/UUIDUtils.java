package com.zh.utils;

import org.springframework.stereotype.Component;

import java.util.UUID;

@Component
public class UUIDUtils {

    public String getUUID(){

        UUID uuid = UUID.randomUUID();

        String s = uuid.toString();

        s = s.replaceAll("-","");

        return s;
    }

}
