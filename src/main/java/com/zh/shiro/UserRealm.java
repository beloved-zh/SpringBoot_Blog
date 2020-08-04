package com.zh.shiro;

import com.zh.pojo.UserBase;
import com.zh.service.UserService;
import org.apache.catalina.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 自定义Realm
 */
public class UserRealm extends AuthorizingRealm {

    @Autowired
    private UserService service;

    //授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();

        //得到当前登录对象
        Subject subject = SecurityUtils.getSubject();
        //拿到user对象
        UserBase user = (UserBase) subject.getPrincipal();

        //设置当前用户的权限
        info.addStringPermission(user.getRole().getRname());

        return info;
    }

    //认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        //获取用户令牌
        UsernamePasswordToken userToken = (UsernamePasswordToken) token;

        UserBase userBase = service.getUserLoginInfo(userToken.getUsername());

        if (userBase == null){
//            return null; //shiro底层会抛出UnKnowAccountException
            throw new LockedAccountException();
        }

        return new SimpleAuthenticationInfo(userBase,userBase.getPassword(),"");
    }
}
