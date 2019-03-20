package com.example.course.controller;

import com.example.course.entity.User;
import com.example.course.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;
    @RequestMapping(value = "/login/inter", method = RequestMethod.GET)
    public User userLogin(HttpServletRequest request, @RequestParam(required = false) String account, @RequestParam(required = false) String pwd){
        User user = null;
        System.out.println(account + "  " + pwd);
        if (account != null && pwd != null) {
             user = userService.userLogin(account, pwd);
        }
        if (user == null){
            user = new User();
        } else {
            request.getSession().setAttribute("user", user);
        }
        System.out.println(user);
        return user;
    }

    @RequestMapping(value = "login/outer", method = RequestMethod.GET)
    public String userLoginOuter(HttpServletRequest request){
        request.getSession().setAttribute("user", null);
        System.out.println("login outer user");
        return "{\"status\":1}";
    }

    @RequestMapping("/update")
    public User userUpdate(){
        User user = null;
        return user;
    }


}
