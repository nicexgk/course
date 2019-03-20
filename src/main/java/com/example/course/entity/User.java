package com.example.course.entity;

import java.io.Serializable;

/*
 * 
 * 
-- 8、用户信息表
-- 8、用户信息表
DROP TABLE IF EXISTS  user_info ;
CREATE TABLE  user_info  (
   user_id  int(11) NOT NULL AUTO_INCREMENT,
   user_type  int(11) DEFAULT NULL,
   user_on  varchar(20) DEFAULT NULL,
   user_name  varchar(50) DEFAULT NULL,
   user_pwd  varchar(36) DEFAULT '123456',
   user_email  varchar(50) DEFAULT NULL,
   user_phone  varchar(11) DEFAULT NULL,
   user_address  varchar(500) DEFAULT NULL,
   user_icon  varchar(200) DEFAULT 'icon/d24.jpg',
   user_introduce  text DEFAULT '这人很懒什么也没留下',
   user_date  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ( user_id ),
  UNIQUE KEY  uaerPhone_unique  ( user_on ),
  UNIQUE KEY  user_email_unique  ( user_email )
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
 * 
 */
public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	// 用户id
	private Integer user_id;
	// 用户类型
	private Integer user_type;
	// 用户学号
	private String user_on;
	// 用户名称
	private String user_name;
	// 用户密码
	private String user_pwd;
	// 用户邮箱
	private String user_email;
	// 用户手机
	private String user_phone;
	// 用户地址
	private String user_address;
	// 用户图标
	private String user_icon;
	// 用户描述
	private String user_introduce;
	// 用户创建日期
	private String user_date;

	public User() {
		super();
	}

	public User(Integer user_id, Integer user_type, String user_on, String user_name, String user_pwd,
			String user_email, String user_phone, String user_address, String user_icon, String user_introduce,
			String user_date) {
		super();
		this.user_id = user_id;
		this.user_type = user_type;
		this.user_on = user_on;
		this.user_name = user_name;
		this.user_pwd = user_pwd;
		this.user_email = user_email;
		this.user_phone = user_phone;
		this.user_address = user_address;
		this.user_icon = user_icon;
		this.user_introduce = user_introduce;
		this.user_date = user_date;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public Integer getUser_type() {
		return user_type;
	}

	public void setUser_type(Integer user_type) {
		this.user_type = user_type;
	}

	public String getUser_on() {
		return user_on;
	}

	public void setUser_on(String user_on) {
		this.user_on = user_on;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public String getUser_icon() {
		return user_icon;
	}

	public void setUser_icon(String user_icon) {
		this.user_icon = user_icon;
	}

	public String getUser_introduce() {
		return user_introduce;
	}

	public void setUser_introduce(String user_introduce) {
		this.user_introduce = user_introduce;
	}

	public String getUser_date() {
		return user_date;
	}

	public void setUser_date(String user_date) {
		this.user_date = user_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_type=" + user_type + ", user_on=" + user_on + ", user_name="
				+ user_name + ", user_pwd=" + user_pwd + ", user_email=" + user_email + ", user_phone=" + user_phone
				+ ", user_address=" + user_address + ", user_icon=" + user_icon + ", user_introduce=" + user_introduce
				+ ", user_date=" + user_date + "]";
	}

}
