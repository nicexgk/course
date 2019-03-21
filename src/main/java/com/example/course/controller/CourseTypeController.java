package com.example.course.controller;

import com.example.course.entity.CourseType;
import com.example.course.service.CourseTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
@RequestMapping("/course")
public class CourseTypeController {
    @Autowired
    CourseTypeService courseTypeService;

    @RequestMapping("/type/catalog")
    public ArrayList<CourseType> courseTypeCatalog(){

        ArrayList<CourseType> courseTypeList = courseTypeService.courseTypeNavigation();
        return courseTypeList;
    }

}
