package com.itheima.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itheima.common.utils.Page;
import com.itheima.core.dao.UserDao;
import com.itheima.core.po.User;
import com.itheima.core.service.UserService;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
	//注入UserDao
	@Autowired
	private UserDao userDao;
	//通过账号和密码查询用户
	@Override
	public User findUser(String uname, String upwd) {
		// TODO Auto-generated method stub
		User user = this.userDao.findUser(uname, upwd);
		return user;
	}
	
	@Override
	public List<User> findUserCar(Integer user_id){
		List<User> user = (List<User>) this.userDao.findUserCar(user_id);
		return user;
	}
	
	@Override
	public User findMine(int user_id) {
		User user = this.userDao.findMine(user_id);
		return user;
	}
	
	@Override
	public Page<User> findMySell(int user_id, Integer page, Integer rows) {
		User user = new User();
		user.setStart((page-1)*rows);
		user.setRows(rows);
		user.setUser_id(user_id);
		List<User> users = userDao.findMySell(user);
		Integer count = userDao.findMySellCount(user);
		Page<User> result = new Page<>();
		result.setPage(page);
		result.setRows(users);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}
	
	@Override
	public void changeUserpwd(int user_id, String pwd) {
		this.userDao.changeUserpwd(user_id, pwd);
	}

	@Override
	public void changeUsertel(int user_id, String tel) {
		this.userDao.changeUsertel(user_id, tel);
	}
	
	@Override
	public void addUser(String username, String upwd, String usercode, Integer user_State) {
		this.userDao.adduser(username, upwd, usercode, user_State);
	}

	@Override
	public User findpwdUser(String username, String usercode) {
		User user = this.userDao.findpwdUser(username, usercode);
		return user;
	}

	@Override
	public void findpwd(String upwd, String usercode) {
		this.userDao.findpwd(upwd, usercode);
	}
	
	@Override
	public void numchange(int c_id, int c_num) {
		this.userDao.numchange(c_id, c_num);
	}
	
	@Override
	public void clearcar(int id) {
		this.userDao.clearcar(id);
	}
	
	@Override
	public void addcar(int id, int num, Integer user_id) {
		this.userDao.addcar(id, num, user_id);
	}
	
	@Override
	public User findUserOldCar(Integer user_id, int id) {
		User user = this.userDao.findUserOldCar(user_id, id);
		return user;
	}
	
	@Override
	public void updatecar(int id, int num, Integer user_id) {
		this.userDao.updatecar(id, num, user_id);
	}
	
	@Override
	public void addlist(Integer user_id, float allprice, String format) {
		this.userDao.addlist(user_id, allprice, format);
	}
	
	@Override
	public User findlist(Integer user_id, float allprice, String format) {
		User user = this.userDao.findlist(user_id, allprice, format);
		return user;
	}
	
	@Override
	public void carlist(Integer user_id, Integer l_id, String str) {
		this.userDao.carlist(user_id, l_id, str);
	}
	
	@Override
	public List<User> findmylist(Integer user_id) {
		List<User> user = this.userDao.findmylist(user_id);
		return user;
	}
	
	@Override
	public void recharge(Integer user_id, float recharge) {
		this.userDao.recharge(user_id, recharge);
	}
	
	@Override
	public void addlist_money(Integer user_id, float price) {
		this.userDao.addlist_money(user_id, price);
	}
}
