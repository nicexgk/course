package com.example.course.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomePageController {
    @RequestMapping("/header")
    public String nice(){
        return "WEB-INF/views/common/header.jsp";
    }

}
