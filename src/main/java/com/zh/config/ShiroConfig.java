package com.zh.config;

import at.pollux.thymeleaf.shiro.dialect.ShiroDialect;
import com.zh.shiro.UserRealm;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.Map;


/**
 * shiro配置类
 */
@Configuration
public class ShiroConfig {

    /**
     * 创建ShiroFilterFactoryBean
     * Subject： 用户主体（把操作交给SecurityManager）
     */
    @Bean
    public ShiroFilterFactoryBean getShiroFilterFactoryBean(@Qualifier("securityManager")DefaultWebSecurityManager securityManager){
        ShiroFilterFactoryBean bean = new ShiroFilterFactoryBean();
        //设置安全管理器
        bean.setSecurityManager(securityManager);

        //添加Shiro内置过滤器
        /**
         *  Shiro内置过滤器，可以实现权限相关的拦截器
         *  常用的过滤器
         *  anon：无需认证(登录)可以访问
         *  authc：必须认证才可以访问
         *  user：如果使用rememberMe的功能可以只直接访问
         *  perms：该资源必须得到资源权限才可以访问
         *  role：该资源必须得到角色权限才可以访问
         */
        Map<String,String> filterMap = new LinkedHashMap<>();

        //静态资源
        filterMap.put("/static/**","anon");

        //前台的请求放行
        filterMap.put("/","anon");
        filterMap.put("/article/**","anon");
        filterMap.put("/bingImage/**","anon");
        filterMap.put("/links/**","anon");
        filterMap.put("/tag/**","anon");

        //登录请求
        filterMap.put("/admin/gotoLogin","anon");
        filterMap.put("/admin/user/login","anon");

        //后台所有的请求必须认证，拥有admin权限
        filterMap.put("/admin/**","authc,perms[admin]");

        //退出
        filterMap.put("/logout","logout");

        //设置登录请求
        bean.setLoginUrl("/admin/gotoLogin");




        //设置未授权跳转的页面
        /*bean.setUnauthorizedUrl("/noAuth");*/

        bean.setFilterChainDefinitionMap(filterMap);
        return bean;
    }

    /**
     * 创建DefaultWebSecurityManager
     * 安全管理器（关联Realm）
     */
    @Bean(name="securityManager")
    public DefaultWebSecurityManager getDefaultWebSecurityManager(@Qualifier("userRealm") UserRealm userRealm){
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        //关联Realm
        securityManager.setRealm(userRealm);
        securityManager.setRememberMeManager(rememberMeManager());
        return securityManager;
    }

    /**
     * 创建Realm
     * Shiro连接数据的桥梁
     */
    @Bean(name = "userRealm")
    public UserRealm userRealm(){
        return new UserRealm();
    }

    //配置ShiroDialect：用来整合Shiro和thymeleaf
    @Bean
    public ShiroDialect getShiroDialect(){
        return new ShiroDialect();
    }

    /**
     * cookie对象
     * @return
     */
    public SimpleCookie rememberMeCookie() {
        //这个参数是cookie的名称，对应前端的checkbox的name = remember
        SimpleCookie simpleCookie = new SimpleCookie("remember");
        //setcookie的httponly属性如果设为true的话，会增加对xss防护的安全系数。它有以下特点：

        //setcookie()的第七个参数
        //设为true后，只能通过http访问，javascript无法访问
        //防止xss读取cookie
        simpleCookie.setHttpOnly(true);
        simpleCookie.setPath("/");
        //<!-- 记住我cookie生效时间30天 ,单位秒;-->
        simpleCookie.setMaxAge(2592000);
        return simpleCookie;
    }

    /**
     * cookie管理对象
     * @return
     */
    public CookieRememberMeManager rememberMeManager() {
        CookieRememberMeManager cookieRememberMeManager = new CookieRememberMeManager();
        cookieRememberMeManager.setCookie(rememberMeCookie());
        //rememberMe cookie加密的密钥 建议每个项目都不一样 默认AES算法 密钥长度(128 256 512 位)
        cookieRememberMeManager.setCipherKey(Base64.decode("4AvVhmFLUs0KTA3Kprsdag=="));
        return cookieRememberMeManager;
    }
}
