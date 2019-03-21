package com.example.course.entity;

import java.io.Serializable;

/*
 * 
 * DROP TABLE IF EXISTS  catalog ;
   CREATE TABLE  catalog_list  (
   catalog_id  int(11) NOT NULL AUTO_INCREMENT,
   parent_id   int(11) DEFAULT NULL,
   catalog_course  int(11) DEFAULT NULL,
   catalog_order  int(11) DEFAULT NULL,
   catalog_type int(11)DEFAULT 0,
   catalog_name  varchar(200) DEFAULT NULL,
   catalog_content varchar(200) DEFAULT NULL,
  PRIMARY KEY ( catalog_id ),
  KEY  catalog_course  ( catalog_course ),
  CONSTRAINT  catalog_ibfk_1  FOREIGN KEY ( parent_id ) REFERENCES  catalog  ( catalog_list ) ON DELETE CASCADE
  CONSTRAINT  catalog_ibfk_2  FOREIGN KEY ( catalog_course ) REFERENCES  course  ( course_id ) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
 * 
 * 
 */
/**
 *	 目录类
 * @author A1621
 *
 */
public class Catalog implements Serializable {
	private static final long serialVersionUID = 1L;
	// 目录id
	private Integer catalog_id;
	// 目录的父类id
	private Integer parent_id;
	// 目录所在的课程
	private Integer catalog_course;
	// 目录的循序
	private Integer catalog_order;
	// 目录的类型 0 代表目录，1代表视频，2代表课件
	private Integer catalog_type;
	// 目录的名字
	private String catalog_name;
	// 目录的内容一般为url路径
	private String catalog_content;

	public Catalog() {
		super();
	}

	public Catalog(Integer catalog_id, Integer parent_id, Integer catalog_course, Integer catalog_order,
			Integer catalog_type, String catalog_name, String catalog_content) {
		super();
		this.catalog_id = catalog_id;
		this.parent_id = parent_id;
		this.catalog_course = catalog_course;
		this.catalog_order = catalog_order;
		this.catalog_type = catalog_type;
		this.catalog_name = catalog_name;
		this.catalog_content = catalog_content;
	}

	public Integer getCatalog_id() {
		return catalog_id;
	}

	public void setCatalog_id(Integer catalog_id) {
		this.catalog_id = catalog_id;
	}

	public Integer getParent_id() {
		return parent_id;
	}

	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}

	public Integer getCatalog_course() {
		return catalog_course;
	}

	public void setCatalog_course(Integer catalog_course) {
		this.catalog_course = catalog_course;
	}

	public Integer getCatalog_order() {
		return catalog_order;
	}

	public void setCatalog_order(Integer catalog_order) {
		this.catalog_order = catalog_order;
	}

	public Integer getCatalot_type() {
		return catalog_type;
	}

	public void setCatalog_type(Integer catalog_type) {
		this.catalog_type = catalog_type;
	}

	public String getCatalog_name() {
		return catalog_name;
	}

	public void setCatalog_name(String catalog_name) {
		this.catalog_name = catalog_name;
	}

	public String getCatalog_content() {
		return catalog_content;
	}

	public void setCatalog_content(String catalog_content) {
		this.catalog_content = catalog_content;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Catalog [catalog_id=" + catalog_id + ", parent_id=" + parent_id + ", catalog_course=" + catalog_course
				+ ", catalog_order=" + catalog_order + ", catalog_type=" + catalog_type + ", catalog_name="
				+ catalog_name + ", catalog_content=" + catalog_content + "]";
	}

}
