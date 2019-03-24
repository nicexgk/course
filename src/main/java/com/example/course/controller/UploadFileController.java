package com.example.course.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;


@RestController
@RequestMapping("/upload")
public class UploadFileController {
    public static SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM");

    // 上传图片
    @RequestMapping("/image")
    public Status uploadImage(HttpServletRequest request, @RequestParam(name = "file") MultipartFile upfile){
        // 获得指定目录的真实路径
        String path = request.getServletContext().getRealPath("/upload/image");
        // 创建文件名
        String filename =  UUID.randomUUID().toString().replace("-","")  + upfile.getOriginalFilename();
        // 获取当前的 年月
        String date = simpleDateFormat.format(new Date());
        // 拼接创建文件的路径
        path += "\\" + date + "\\" + filename;
        // 创建文件的保存对象
        File file = new File(path);
        // 创建目录
        if (!file.getParentFile().exists()){
            file.getParentFile().mkdirs();
            System.out.println("mk dirs");
        }
        // 创建返回前端的状态对象
        Status status = new Status();
        try {
            // 创建文件
            if(!file.exists()){
                file.createNewFile();
                System.out.println("mk file");
            }
            upfile.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
            status.setStatus("0");
            return status;
        }
        System.out.println(file.getAbsolutePath());
        System.out.println(path);
        status.setPath("/upload/image/" + date + "/" + file.getName());
        status.setStatus("1");
        System.out.println(status);
        return status;
    }

    // 上传视频
    @RequestMapping("/video")
    public String upload(HttpServletRequest request) {
        System.out.println(request.getContextPath());
        System.out.println(request.getServletContext().getClassLoader().getParent());
        System.out.println(request.getServletContext().getContextPath());
        return "路径" + request.getContextPath();
    }

    // 状类
    public class Status {
        private String status;
        private String path;

        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }

        public String getPath() {
            return path;
        }

        public void setPath(String path) {
            this.path = path;
        }

        @Override
        public String toString() {
            return "Status{" +
                    "status='" + status + '\'' +
                    ", path='" + path + '\'' +
                    '}';
        }
    }

}
