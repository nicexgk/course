package com.example.course.service;

import com.example.course.dao.CourseTypeMapper;
import com.example.course.entity.CourseType;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service
public class CourseTypeServiceImpl implements CourseTypeService {
    @Resource
    CourseTypeMapper courseTypeMapper;

    @Override
    public ArrayList<CourseType> courseTypeNavigation() {
        return getCourseTypeCatalog();
    }

    public ArrayList<CourseType> getCourseTypeCatalog() {
        ArrayList<CourseType> parentTypeList = courseTypeMapper.queryOriginType();
        ArrayList<CourseType> secondTypeList = courseTypeMapper.queryTypeByIdOnChile(parentTypeList);
        ArrayList<CourseType> chileTypeList = courseTypeMapper.queryTypeByIdOnChile(secondTypeList);
        for (CourseType parentType : parentTypeList) {
            if (parentType.getSubclassList() == null) {
                parentType.setSubclassList(new ArrayList<CourseType>());
            }

            for (CourseType secondType : secondTypeList) {
                if (secondType.getSubclassList() == null) {
                    secondType.setSubclassList(new ArrayList<CourseType>());
                }
                if (secondType.getParent_id() == parentType.getType_id()) {
                    if (parentType.getSubclassList().indexOf(secondType) == -1) {
                        parentType.getSubclassList().add(secondType);
                    }
                }
                for (CourseType chileType : chileTypeList) {
                    if (chileType.getParent_id() == secondType.getType_id()) {
                        if (secondType.getSubclassList().indexOf(chileType) == -1) {
                            secondType.getSubclassList().add(chileType);
                        }
                    }
                }
            }
        }

        return parentTypeList;
    }

    @Override
    public ArrayList<CourseType> OriginCourseType() {
        return courseTypeMapper.queryOriginType();
    }

    @Override
    public ArrayList<CourseType> courseTypeOnChile(ArrayList<CourseType> parentTypeList) {
        ArrayList<CourseType> courseTypeChile = courseTypeMapper.queryTypeByIdOnChile(parentTypeList);
        return courseTypeChile;
    }

}
