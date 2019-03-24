package com.example.course.dao;

import com.example.course.controller.DynamicSelectProvider;
import com.example.course.entity.CourseType;
import org.apache.ibatis.annotations.*;

import java.util.ArrayList;

@Mapper
public interface CourseTypeMapper {

    @Select("select * from course_type where parent_id is null")
    @Results({
            @Result(property = "type_id", column = "type_id"),
            @Result(property = "parent_id", column = "parent_id"),
            @Result(property = "type_name", column = "type_name"),
    })
    public ArrayList<CourseType> queryOriginType();


//    @SelectProvider(type = DynamicSelectProvider.class, method = "queryChildCourseType")
    @Select("<script>" +
            "select * from course_type where parent_id in " +
            "<foreach item='item' index='index' collection='list' open='(' separator=',' close=')'> #{item.type_id} </foreach> " +
            "</script>")
    @Results({
            @Result(property = "type_id", column = "type_id"),
            @Result(property = "parent_id", column = "parent_id"),
            @Result(property = "type_name", column = "type_name"),
    })
    public ArrayList<CourseType> queryTypeByIdOnChile(ArrayList<CourseType> parentCourseType);



}
