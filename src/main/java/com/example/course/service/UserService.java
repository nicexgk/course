package com.example.course.service;

import com.example.course.entity.User;

/**
 *用户登录服务处接口
 */
public interface UserService {

    public User userLogin(String account, String pwd);

}
