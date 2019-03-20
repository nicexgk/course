package com.example.course.entity;

import java.io.Serializable;

/*
 * 
 * 
 * -- 5、课程表
DROP TABLE IF EXISTS  course ;
CREATE TABLE  course  (
   course_id  int(11) NOT NULL AUTO_INCREMENT,
   course_teacher_id  int(11) DEFAULT '4',
   course_price  int(11) DEFAULT '0',
   course_type  int(11) DEFAULT NULL,
   course_person_number  varchar(255) DEFAULT NULL,
   course_name  varchar(50) DEFAULT NULL,
   description  text,
   pic_url  varchar(200) DEFAULT 'icon/6.jpg',
   course_content_list varchar(50) DEFAULT NULL,
   course_date  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ( course_id ),
  KEY  course_teacher_id  ( course_teacher_id ),
  KEY  course_course_type_fk  ( course_type ),
  CONSTRAINT  course_ibfk_1  FOREIGN KEY ( course_teacher_id ) REFERENCES  user_info  ( user_id ) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

 * 
 * 
 */
/**
 * 课程类
 * 
 * @author A1621
 *
 */
public class Course implements Serializable {
	private static final long serialVersionUID = 1L;
	// 课程id
	private Integer course_id;
	// 课程教师
	private User course_teacher;
	// 课程价格
	private Integer course_price;
	// 课程类型
	private Integer course_type;
	// 课程编号
	private String course_person_nember;
	// 课程名字
	private String course_name;
	// 课程描述
	private String description;
	// 课程图标url路径
	private String pic_url;
	// 课程内容列表
	private String course_content_list;
	// 课程创建日期
	private String course_date;

	public Course() {
		super();
	}

	public Course(Integer course_id, User course_teacher, Integer course_price, Integer course_type,
			String course_person_nember, String course_name, String description, String pic_url,
			String course_content_list, String course_date) {
		super();
		this.course_id = course_id;
		this.course_teacher = course_teacher;
		this.course_price = course_price;
		this.course_type = course_type;
		this.course_person_nember = course_person_nember;
		this.course_name = course_name;
		this.description = description;
		this.pic_url = pic_url;
		this.course_content_list = course_content_list;
		this.course_date = course_date;
	}

	public Integer getCourse_id() {
		return course_id;
	}

	public void setCourse_id(Integer course_id) {
		this.course_id = course_id;
	}

	public User getCourse_teacher() {
		return course_teacher;
	}

	public void setCourse_teacher(User course_teacher) {
		this.course_teacher = course_teacher;
	}

	public Integer getCourse_price() {
		return course_price;
	}

	public void setCourse_price(Integer course_price) {
		this.course_price = course_price;
	}

	public Integer getCourse_type() {
		return course_type;
	}

	public void setCourse_type(Integer course_type) {
		this.course_type = course_type;
	}

	public String getCourse_person_nember() {
		return course_person_nember;
	}

	public void setCourse_person_nember(String course_person_nember) {
		this.course_person_nember = course_person_nember;
	}

	public String getCourse_name() {
		return course_name;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPic_url() {
		return pic_url;
	}

	public void setPic_url(String pic_url) {
		this.pic_url = pic_url;
	}

	public String getCourse_content_list() {
		return course_content_list;
	}

	public void setCourse_content_list(String course_content_list) {
		this.course_content_list = course_content_list;
	}

	public String getCourse_date() {
		return course_date;
	}

	public void setCourse_date(String course_date) {
		this.course_date = course_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Course [course_id=" + course_id + ", course_teacher=" + course_teacher + ", course_price="
				+ course_price + ", course_type=" + course_type + ", course_person_nember=" + course_person_nember
				+ ", course_name=" + course_name + ", description=" + description + ", pic_url=" + pic_url
				+ ", course_content_list=" + course_content_list + ", course_date=" + course_date + "]";
	}

}
