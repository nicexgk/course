package com.example.course;

import com.example.course.dao.UserMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CourseApplicationTests {

    @Resource
    UserMapper userMapper;

    @Test
    public void contextLoads() {
        System.out.println(userMapper.queryUser("123456", "123456"));
    }

}
