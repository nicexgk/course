package com.example.course.entity;

import java.io.Serializable;

/*
 * 
 * 
 * -- 2、收藏表
DROP TABLE IF EXISTS  collection_list;
CREATE TABLE  collection_list (
   collection_id  int(11) NOT NULL AUTO_INCREMENT,
   collection_user  int(11) DEFAULT NULL,
   collection_course  int(11) DEFAULT NULL,
   collection_date  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ( collection_id ),
  KEY  collection_user  ( collection_user ),
  KEY  collection_course  ( collection_course ),
  CONSTRAINT  collection_ibfk_1  FOREIGN KEY ( collection_user ) REFERENCES  user_info  ( user_id ),
  CONSTRAINT  collection_ibfk_2  FOREIGN KEY ( collection_course ) REFERENCES  course  ( course_id )
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 * 
 * 
 */
/**
 * 收藏表
 * 
 * @author A1621
 *
 */
public class CollectionList implements Serializable {
	private static final long serialVersionUID = 1L;
	// 收藏id
	private Integer collection_id;
	// 收藏的用户
	private Integer collection_user;
	// 收藏对应的课程
	private Course collection_course;
	// 收藏的时间
	private String collection_date;

	public CollectionList() {
		super();
	}

	public CollectionList(Integer collection_id, Integer collection_user, Course collection_course,
			String collection_date) {
		super();
		this.collection_id = collection_id;
		this.collection_user = collection_user;
		this.collection_course = collection_course;
		this.collection_date = collection_date;
	}

	public Integer getCollection_id() {
		return collection_id;
	}

	public void setCollection_id(Integer collection_id) {
		this.collection_id = collection_id;
	}

	public Integer getCollection_user() {
		return collection_user;
	}

	public void setCollection_user(Integer collection_user) {
		this.collection_user = collection_user;
	}

	public Course getCollection_course() {
		return collection_course;
	}

	public void setCollection_course(Course collection_course) {
		this.collection_course = collection_course;
	}

	public String getCollection_date() {
		return collection_date;
	}

	public void setCollection_date(String collection_date) {
		this.collection_date = collection_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "CollectionList [collection_id=" + collection_id + ", collection_user=" + collection_user
				+ ", collection_course=" + collection_course + ", collection_date=" + collection_date + "]";
	}

}
