package com.itheima.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itheima.core.po.User;

public interface UserDao {
	/**
	 * 通过账号和密码查询用户
	 */
	public User findUser(@Param("usercode") String usercode,@Param("password") String password);

	public User findMine(@Param("user_id") int user_id);
	
	public List<User> findMySell(User user);
	public Integer findMySellCount(User user);

	public void changeUsertel(@Param("user_id") int user_id, @Param("tel") String tel);

	public void changeUserpwd(@Param("user_id") int user_id, @Param("pwd") String pwd);

	public void adduser(@Param("username") String username, @Param("upwd") String upwd,
			@Param("usercode") String usercode, @Param("user_State") Integer user_State);

	public User findpwdUser(@Param("username") String username, @Param("usercode") String usercode);

	public void findpwd(@Param("upwd") String upwd, @Param("usercode") String usercode);

	public List<User> findUserCar(@Param("user_id")Integer user_id);

	public void numchange(@Param("c_id")int c_id, @Param("c_num")int c_num);

	public void clearcar(@Param("id")int id);

	public void addcar(@Param("id")int id, @Param("num")int num, @Param("user_id")Integer user_id);

	public User findUserOldCar(@Param("user_id")Integer user_id, @Param("id")int id);

	public void updatecar(@Param("id")int id, @Param("num")int num, @Param("user_id")Integer user_id);

	public void addlist(@Param("user_id")Integer user_id, @Param("allprice")float allprice, @Param("format")String format);

	public User findlist(@Param("user_id")Integer user_id, @Param("allprice")float allprice, @Param("format")String format);

	public void carlist(@Param("user_id")Integer user_id, @Param("l_id")Integer l_id, @Param("str")String str);

	public List<User> findmylist(@Param("user_id")Integer user_id);

	public void recharge(@Param("user_id")Integer user_id, @Param("recharge")float recharge);

	public void addlist_money(@Param("user_id")Integer user_id, @Param("price")float price);

	
}
