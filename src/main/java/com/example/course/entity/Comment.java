package com.example.course.entity;

import java.io.Serializable;

/*
 * 
 * 
 * 
 * -- 3、评论表
DROP TABLE IF EXISTS  comments ;
CREATE TABLE  comments  (
   comment_id  int(11) NOT NULL AUTO_INCREMENT,
   comment_user  int(11) DEFAULT NULL,
   comment_grade  int(11) DEFAULT '5',
   comment_course  int(11) DEFAULT NULL,
   comment_content varchar(1000) DEFAULT NULL,
   comment_date  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ( comment_id ),
  KEY  comment_user  ( comment_user ),
  KEY  comment_course  ( comment_course ),
  CONSTRAINT  comments_ibfk_1  FOREIGN KEY ( comment_user ) REFERENCES  user_info  ( user_id ) ON DELETE CASCADE,
  CONSTRAINT  comments_ibfk_2  FOREIGN KEY ( comment_course ) REFERENCES  course  ( course_id ) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

 * 
 * 
 */
/**
 * 课程评论表
 * 
 * @author A1621
 *
 */
public class Comment implements Serializable {
	private static final long serialVersionUID = 1L;
	// 评论id
	private Integer comment_id;
	// 评论的用户
	private User comment_user;
	// 评论的评分
	private Integer comment_grade;
	// 评论的课程
	private Integer comment_course;
	// 评论的内容
	private String comment_content;
	// 评论的日期
	private String comment_date;

	public Comment() {
		super();
	}

	public Comment(Integer comment_id, User comment_user, Integer comment_grade, Integer comment_course,
			String comment_content, String comment_date) {
		super();
		this.comment_id = comment_id;
		this.comment_user = comment_user;
		this.comment_grade = comment_grade;
		this.comment_course = comment_course;
		this.comment_content = comment_content;
		this.comment_date = comment_date;
	}

	public Integer getComment_id() {
		return comment_id;
	}

	public void setComment_id(Integer comment_id) {
		this.comment_id = comment_id;
	}

	public User getComment_user() {
		return comment_user;
	}

	public void setComment_user(User comment_user) {
		this.comment_user = comment_user;
	}

	public Integer getComment_grade() {
		return comment_grade;
	}

	public void setComment_grade(Integer comment_grade) {
		this.comment_grade = comment_grade;
	}

	public Integer getComment_course() {
		return comment_course;
	}

	public void setComment_course(Integer comment_course) {
		this.comment_course = comment_course;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public String getComment_date() {
		return comment_date;
	}

	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Comment [comment_id=" + comment_id + ", comment_user=" + comment_user + ", comment_grade="
				+ comment_grade + ", comment_course=" + comment_course + ", comment_content=" + comment_content
				+ ", comment_date=" + comment_date + "]";
	}

}
