package com.example.course.controller;

import com.example.course.entity.CourseType;
import com.example.course.service.CourseTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

@Controller
public class HomePageController {
    @Autowired
    CourseTypeService courseTypeService;

    @RequestMapping("/header")
    public String nice(HttpServletRequest request){
        System.out.println(request.getServletContext().getContextPath());
        System.out.println(request.getServletContext().getContext("/img").getContextPath());
        System.out.println(request.getServletContext().getRealPath("/img"));
        return "WEB-INF/views/coursereflash.jsp";
    }

    @RequestMapping("/index.html")
    public String index(HttpServletRequest request){
        ArrayList<CourseType> courseTypeArrayList = courseTypeService.courseTypeNavigation();
        request.setAttribute("courseTypeCatalog", courseTypeArrayList);
        return "index.jsp";
    }

}
