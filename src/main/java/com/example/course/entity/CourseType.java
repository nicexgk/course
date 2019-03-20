package com.example.course.entity;

import java.io.Serializable;

/*
 * 
 * 
 * -- 6、课程类型表
DROP TABLE IF EXISTS  course_type ;
CREATE TABLE  course_type  (
   type_id  int(11) NOT NULL AUTO_INCREMENT,
   parent_id  int(11) DEFAULT '1',
   type_name  varchar(255) DEFAULT NULL,
  PRIMARY KEY ( type_id ),
  CONSTRAINT  parent_id_k1  FOREIGN KEY ( parent_id ) REFERENCES  course_type  ( type_id ) ON DELETE SET DELETE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

 * 
 * 
 */

/**
 * 		 课程类型表
 * 
 * @author A1621
 *
 */
public class CourseType implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer type_id;
	private Integer parent_id;
	private String type_name;

	public CourseType() {
		super();
	}

	public CourseType(Integer type_id, Integer parent_id, String type_name) {
		super();
		this.type_id = type_id;
		this.parent_id = parent_id;
		this.type_name = type_name;
	}

	public Integer getType_id() {
		return type_id;
	}

	public void setType_id(Integer type_id) {
		this.type_id = type_id;
	}

	public Integer getParent_id() {
		return parent_id;
	}

	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "CourseType [type_id=" + type_id + ", parent_id=" + parent_id + ", type_name=" + type_name + "]";
	}

}
