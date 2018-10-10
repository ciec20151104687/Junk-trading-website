package com.itheima.core.service;


import java.util.List;

import com.itheima.common.utils.Page;
import com.itheima.core.po.User;


public interface UserService {
	//通过账号和密码查询用户
	public User findUser(String uname, String upwd);

	public User findMine(int user_id);

	public Page<User> findMySell(int user_id, Integer page, Integer rows);

	public void changeUserpwd(int user_id, String pwd);

	public void changeUsertel(int user_id, String tel);

	public void addUser(String username, String upwd, String usercode, Integer user_State);

	public User findpwdUser(String username, String usercode);

	public void findpwd(String upwd, String usercode);

	public List<User> findUserCar(Integer user_id);

	public void numchange(int c_id, int c_num);

	public void clearcar(int id);

	public void addcar(int id, int num, Integer user_id);

	public User findUserOldCar(Integer user_id, int id);

	public void updatecar(int id, int num, Integer user_id);

	public void addlist(Integer user_id, float allprice, String format);

	public User findlist(Integer user_id, float allprice, String format);

	public void carlist(Integer user_id, Integer l_id, String string);

	public List<User> findmylist(Integer user_id);

	public void recharge(Integer user_id, float rec);

	public void addlist_money(Integer user_id, float price);


}
