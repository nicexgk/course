package com.example.course.entity;

import java.io.Serializable;

/*
 * 
 * 
 * -- 9、用户课程表
DROP TABLE IF EXISTS  user_course ;
CREATE TABLE  user_course  (
   user_course_id  int(11) NOT NULL AUTO_INCREMENT,
   user_id  int(11) DEFAULT NULL,
   course_id  int(11) DEFAULT NULL,
   user_course_date  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ( user_course_id ),
  KEY  user_id  ( user_id ),
  KEY  course_id  ( course_id ),
  CONSTRAINT  user_course_ibfk_1  FOREIGN KEY ( user_id ) REFERENCES  user_info  ( user_id ),
  CONSTRAINT  user_course_ibfk_2  FOREIGN KEY ( course_id ) REFERENCES  course  ( course_id )
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

 * 
 * 
 */
/**
 * 用户课程表
 * 
 * @author A1621
 *
 */
public class UserCourse implements Serializable {
	private static final long serialVersionUID = 1L;
	// 用户课程表对应的id
	private Integer user_course_id;
	// 用户对应的id
	private Integer user_id;
	// 课程对象
	private Course course;
	// 用户参加课程的时间
	private String user_course_date;

	public UserCourse() {
		super();
	}

	public UserCourse(Integer user_course_id, Integer user_id, Course course, String user_course_date) {
		super();
		this.user_course_id = user_course_id;
		this.user_id = user_id;
		this.course = course;
		this.user_course_date = user_course_date;
	}

	public Integer getUser_course_id() {
		return user_course_id;
	}

	public void setUser_course_id(Integer user_course_id) {
		this.user_course_id = user_course_id;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public String getUser_course_date() {
		return user_course_date;
	}

	public void setUser_course_date(String user_course_date) {
		this.user_course_date = user_course_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "UserCourse [user_course_id=" + user_course_id + ", user_id=" + user_id + ", course=" + course
				+ ", user_course_date=" + user_course_date + "]";
	}

}
