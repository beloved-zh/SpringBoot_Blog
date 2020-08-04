package com.zh.controller.admin;

import com.zh.pojo.UserBase;
import com.zh.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/user")
public class AdminUserController {

    @Autowired
    private UserService service;

    @PostMapping("/login")
    public String login(String userNo, String password,boolean remember, Model model){
        System.out.println("remember"+remember);
        /**
         * 使用Shiro编写认证操作
         */
        //获取当前用户
        Subject subject = SecurityUtils.getSubject();
        //封装用户登录数据
        UsernamePasswordToken token = new UsernamePasswordToken(userNo, password,remember);
        //执行登录方法
        try {
            subject.login(token);

            Session session = subject.getSession();
            UserBase userBase = (UserBase)subject.getPrincipal();
            session.setAttribute("user",userBase);

            return "redirect:/admin/gotoHome";
        } catch (UnknownAccountException e) {
            e.printStackTrace();
            model.addAttribute("msg","用户名不存在");
            return "redirect:/admin/gotoLogin";
        } catch (IncorrectCredentialsException e) {
            e.printStackTrace();
            model.addAttribute("msg", "密码错误");
            return "redirect:/admin/gotoLogin";
        }

    }

}
