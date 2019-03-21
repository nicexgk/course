package com.example.course.service;

import com.example.course.entity.CourseType;

import java.util.ArrayList;

public interface CourseTypeService {

    public ArrayList<CourseType> courseTypeNavigation();

    public ArrayList<CourseType> OriginCourseType();
    public ArrayList<CourseType> courseTypeOnChile(ArrayList<CourseType> parentTypeList);
}
