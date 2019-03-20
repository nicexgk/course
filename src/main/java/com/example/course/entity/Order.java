package com.example.course.entity;

import java.io.Serializable;

/*
 * 
 * 
 * -- 7、订单表
DROP TABLE IF EXISTS  orders ;
CREATE TABLE  orders  (
   order_id  int(11) NOT NULL AUTO_INCREMENT,
   order_on  varchar(36) DEFAULT NULL,
   order_status  int(11) DEFAULT '0',
   order_user  int(11) DEFAULT NULL,
   order_course  int(11) DEFAULT NULL,
   order_date  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ( order_id ),
  UNIQUE KEY  order_on  ( order_on ),
  KEY  order_user  ( order_user ),
  KEY  order_course  ( order_course ) USING BTREE,
  CONSTRAINT  orders_ibfk_1  FOREIGN KEY ( order_user ) REFERENCES  user_info  ( user_id ),
  CONSTRAINT  orders_ibfk_2  FOREIGN KEY ( order_course ) REFERENCES  course  ( course_id )
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

 * 
 * 
 */

/**
 * 订单类
 * 
 * @author A1621
 *
 */
public class Order implements Serializable {
	private static final long serialVersionUID = 1L;
	// 订单id
	private Integer order_id;
	// 订单编号
	private Integer order_on;
	// 订单状态
	private Integer order_status;
	// 订单的用户
	private Integer order_user;
	// 订单的对应的课程
	private Course order_course;
	// 订单创建日期
	private String order_date;

	public Order() {
		super();
	}

	public Order(Integer order_id, Integer order_on, Integer order_status, Integer order_user, Course order_course,
			String order_date) {
		super();
		this.order_id = order_id;
		this.order_on = order_on;
		this.order_status = order_status;
		this.order_user = order_user;
		this.order_course = order_course;
		this.order_date = order_date;
	}

	public Integer getOrder_id() {
		return order_id;
	}

	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}

	public Integer getOrder_on() {
		return order_on;
	}

	public void setOrder_on(Integer order_on) {
		this.order_on = order_on;
	}

	public Integer getOrder_status() {
		return order_status;
	}

	public void setOrder_status(Integer order_status) {
		this.order_status = order_status;
	}

	public Integer getOrder_user() {
		return order_user;
	}

	public void setOrder_user(Integer order_user) {
		this.order_user = order_user;
	}

	public Course getOrder_course() {
		return order_course;
	}

	public void setOrder_course(Course order_course) {
		this.order_course = order_course;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", order_on=" + order_on + ", order_status=" + order_status
				+ ", order_user=" + order_user + ", order_course=" + order_course + ", order_date=" + order_date + "]";
	}

}
