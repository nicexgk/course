package com.example.course.controller;

import com.example.course.entity.Course;
import com.example.course.entity.CourseType;
import com.example.course.entity.User;
import com.example.course.service.CourseService;
import com.example.course.service.CourseTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.print.attribute.standard.Media;
import javax.print.attribute.standard.MediaTray;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

@Controller
public class CourseManageController {

    @Autowired
    CourseTypeService courseTypeService;
    @Autowired
    CourseService courseService;

    @RequestMapping("/coursemanage")
    public String CourseManage(HttpServletRequest request) {
        ArrayList<CourseType> courseTypeArrayList = courseTypeService.courseTypeNavigation();
        request.setAttribute("courseTypeCatalog", courseTypeArrayList);
        return "WEB-INF/views/coursemanage.jsp";
    }

    @RequestMapping(value = "/addcourse", method = RequestMethod.GET)
    @ResponseBody
    public Status addCourse(HttpServletRequest request, Course course) {
        Status status = new Status();
        System.out.println(course);
        User user = (User)request.getSession().getAttribute("user");
        course.setCourse_teacher(user);
        boolean flag = courseService.addCourse(course);
        if (flag) {
            status.setStatus("1");
        } else {
            status.setStatus("1");
        }
        return status;
    }

    // 相应状态对象
    public class Status {
        private String status;
        private String description;

        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }

        @Override
        public String toString() {
            return "Status{" +
                    "status='" + status + '\'' +
                    ", description='" + description + '\'' +
                    '}';
        }
    }
}
