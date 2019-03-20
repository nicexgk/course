package com.example.course.service;


import com.example.course.dao.UserMapper;
import com.example.course.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    UserMapper userMapper;

    @Override
    public User userLogin(String account, String pwd) {
        User user = userMapper.queryUser(account, pwd);
        return user;
    }
}
