package com.example.course.service;

import com.example.course.dao.CourseMapper;
import com.example.course.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CourseServiceImpl implements CourseService {
    @Resource
    CourseMapper courseMapper;

    @Override
    public boolean addCourse(Course course) {
        return courseMapper.addCourse(course);
    }
}
