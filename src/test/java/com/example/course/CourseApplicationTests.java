package com.example.course;

import com.example.course.dao.CourseMapper;
import com.example.course.dao.CourseTypeMapper;
import com.example.course.dao.UserMapper;
import com.example.course.entity.Course;
import com.example.course.entity.CourseType;
import com.example.course.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.ArrayList;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CourseApplicationTests {

    @Resource
    UserMapper userMapper;
    @Resource
    CourseTypeMapper courseTypeMapper;
    @Resource
    CourseMapper courseMapper;

    @Test
    public void contextLoads() {
//        System.out.println(userMapper.queryUser("123456", "123456"));
//        ArrayList<CourseType> courseTypeList = courseTypeMapper.queryOriginType();
//        System.out.println(courseTypeList);
//        System.out.println(courseTypeMapper.queryTypeByIdOnChile(courseTypeList));
        Course course = new Course();
        course.setCourse_name("jjjjjdfdfdfjjjjjjj");
        User user = new User();
//        course.setCourseTeacher(user);
        System.out.println(courseMapper.addCourse(course));
    }

}
