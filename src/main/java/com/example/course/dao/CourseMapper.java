package com.example.course.dao;

import com.example.course.entity.Course;

import java.util.ArrayList;



public interface CourseMapper {

	public Course queryCourseById(int id);
	
	public ArrayList<Course> queryCourseByName(String name);
	
	public ArrayList<Course> getCourse(int size);
	
	public ArrayList<Course> queryCourseByTeacher(String teacher, int size);
	
	
}
