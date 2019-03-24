package com.example.course.dao;

import com.example.course.entity.Course;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.jdbc.SQL;

import java.util.ArrayList;

@Mapper
public interface CourseMapper {

    public Course queryCourseById(int id);

    public ArrayList<Course> queryCourseByName(String name);

    public ArrayList<Course> getCourse(int size);

    public ArrayList<Course> queryCourseByTeacher(String teacher, int size);

    @InsertProvider(type = MySqlProvider.class, method = "addCourseProvide")
    public boolean addCourse(Course course);

    public boolean addCourse2(@Param("course") Course course);

    class MySqlProvider {
        public String addCourseProvide(Course course) {
            return new SQL() {

//                {
//                    INSERT_INTO("course");
//                    VALUES("course_name, course_teacher_id", "'dlkfjdlfjdlfdjf', 7");
//                }

                {
                    INSERT_INTO("course");
                    String str = "";
                    String val = "";
                    boolean flag = false;
                    if (course.getCourse_teacher() != null) {
                        if(flag) {
                            str += ",";
                        }
                        flag = true;
                        str += "course_teacher_id";
                    }
                    if (course.getCourse_price() != null) {
                        if(flag) {
                            str += ",";
                        }
                        flag = true;
                        str += "course_price";
                    }
                    if (course.getCourse_type() != null) {
                        if(flag) {
                            str += ",";
                        }
                        flag = true;
                        str += "course_type";
                    }
                    if (course.getCourse_person_number() != null) {
                        if(flag) {
                            str += ",";
                        }
                        flag = true;
                        str += "course_person_number";
                    }
                    if (course.getCourse_name() != null) {
                        if(flag) {
                            str += ",";
                        }
                        flag = true;
                        str += "course_name";
                    }
                    if (course.getDescription() != null) {
                        if(flag) {
                            str += ",";
                        }
                        flag = true;
                        str += "description";
                    }
                    if (course.getPic_url() != null) {
                        if(flag) {
                            str += ",";
                        }
                        flag = true;
                        str += "pic_url";
                    }
                    if (course.getCourse_content_list() != null) {
                        if(flag) {
                            str += ",";
                        }
                        flag = true;
                        str += "course_content_list";
                    }

                    flag = false;
                    if (course.getCourse_teacher() != null) {
                        if(flag) {
                            str += ",";
                        }
                        flag = true;
                        val += "#{course_teacher.user_id}";
                    }
                    if (course.getCourse_price() != null) {
                        if(flag) {
                            val += ",";
                        }
                        flag = true;
                        val += "#{course.course_price}";
                    }
                    if (course.getCourse_type() != null) {
                        if(flag) {
                            val += ",";
                        }
                        flag = true;
                        val += "#{course_type}";
                    }
                    if (course.getCourse_person_number() != null) {
                        if(flag) {
                            val += ",";
                        }
                        flag = true;
                        val += "#{course_person_number}";
                    }
                    if (course.getCourse_name() != null) {
                        if(flag) {
                            val += ",";
                        }
                        flag = true;
                        val += "#{course_name}";
                    }
                    if (course.getDescription() != null) {
                        if(flag) {
                            val += ",";
                        }
                        flag = true;
                        val += "#{description}";
                    }
                    if (course.getPic_url() != null) {
                        if(flag) {
                            val += ",";
                        }
                        flag = true;
                        val += "#{pic_url}";
                    }
                    if (course.getCourse_content_list() != null) {
                        if(flag) {
                            val += ",";
                        }
                        flag = true;
                        val += "#{course_content_list}";
                    }
                    VALUES(str, val);
                }
            }.toString();
        }
    }
}
