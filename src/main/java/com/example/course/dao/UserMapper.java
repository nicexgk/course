package com.example.course.dao;

import com.example.course.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;



@Mapper
public interface UserMapper {

	/**
	 * @discription 根据用户的学号用户的邮箱，及密码进行查询用户信息
	 * @param account 用户的学号或邮箱
	 * @param pwd 用户的密码
	 * @return 返回查询到的用户对象，查询不到返回null
	 */
	@Select("select * from user_info where (user_on = #{arg0} or user_email = #{arg0}) and user_pwd = #{arg1}")
	@Results({
			@Result(property = "user_id", column = "user_id"),
			@Result(property = "user_type", column = "user_type"),
			@Result(property = "user_on", column = "user_on"),
			@Result(property = "user_name", column = "user_name"),
			@Result(property = "user_pwd", column = "user_pwd"),
			@Result(property = "user_email", column = "user_email"),
			@Result(property = "user_phone", column = "user_phone"),
			@Result(property = "user_address", column = "user_address"),
			@Result(property = "user_icon", column = "user_icon"),
			@Result(property = "user_introduce", column = "user_introduce"),
			@Result(property = "user_date", column = "user_date"),
	})
	public User queryUser(String account, String pwd);
	
	public User userLoginByOn(String on, String pwd);
	
	public User userLingoByEmail(String email, String pwd);
	
	public boolean inserUser(User user);
	
	public boolean updateUser(User user);
	
}
