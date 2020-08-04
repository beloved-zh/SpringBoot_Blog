package com.zh.utils;

import com.alibaba.druid.sql.visitor.functions.Bin;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.zh.pojo.BingImage;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

@Component
public class BingImageUtils {

    public BingImage getImage(){
        //必应每日一图接口
        String bing = "https://cn.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1";
        String str = "";
        try {
            URL url = new URL(bing);
            URLConnection conn = url.openConnection();
            //字符缓冲输入流
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));//转码。
            String line;
            while ((line = br.readLine()) != null){
                str += line;
            }
            br.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        //将字符串转换为json
        JSONObject jsonObject = JSONObject.parseObject(str);

        //获取图片的数据
        JSONArray images = jsonObject.getJSONArray("images");

        //图片数据是一个数组，长度为1
        String s = images.get(0).toString();

        //将数据转换为json
        JSONObject jsonObject1 = JSONObject.parseObject(s);

        String url = jsonObject1.get("url").toString();
        url = "https://www.bing.com" + url;
        String copyright = jsonObject1.get("copyright").toString();

        copyright = copyright.substring(0,copyright.indexOf("("));

        BingImage bingImage = new BingImage(0,copyright,url);

        return bingImage;
    }

}
