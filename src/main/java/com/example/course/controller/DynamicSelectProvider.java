package com.example.course.controller;

import com.example.course.entity.CourseType;
import org.apache.ibatis.jdbc.SQL;

import java.util.ArrayList;
import java.util.List;

public class DynamicSelectProvider {

    public String queryChildCourseType(List<CourseType> parentTypeList) {
        System.out.println(parentTypeList);
        String sql  = new SQL() {
            {
                SELECT("*");
                FROM("course_type");
//                for (int i = 0; i < parentTypeList.size(); i++) {
//                    WHERE("parent_id = #{parentTypeList = " + parentTypeList.get(i).getType_id() +"}");
//                    if (i >=  parentTypeList.size() - 1){
//                        OR();
//                    }
//                }

            }
        }.toString();
        return sql;
    }
}
