package com.itheima.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itheima.common.utils.Page;
import com.itheima.core.dao.BuyDao;
import com.itheima.core.po.Buys;
import com.itheima.core.service.BuyService;

@Service("buyService")
@Transactional
public class BuyServiceImpl implements BuyService{
	@Autowired
	private BuyDao buyDao;
	
	@Override
	public Page<Buys> findBuy1(String b_type, Integer page, Integer rows) {
		// TODO Auto-generated method stub
		Buys buy = new Buys();
		buy.setStart((page-1)*rows);
		buy.setRows(rows);
		buy.setB_type(b_type);
		List<Buys> buys = buyDao.findBuy1(buy);
		
		Integer count = buyDao.findBuy1Count(buy);
		Page<Buys> result = new Page<>();
		result.setPage(page);
		result.setRows(buys);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}
	
	@Override
	public Page<Buys> findBuy2(String b_name, Integer page, Integer rows){
		Buys buy = new Buys();
		buy.setStart((page-1)*rows);
		buy.setRows(rows);
		buy.setB_name(b_name);
		List<Buys> buys = buyDao.findBuy2(buy);
		Integer count = buyDao.findBuy2Count(buy);
		Page<Buys> result = new Page<>();
		result.setPage(page);
		result.setRows(buys);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

	@Override
	public Page<Buys> findBuy3(String b_type, String b_name, Integer page, Integer rows){
		Buys buy = new Buys();
		buy.setStart((page-1)*rows);
		buy.setRows(rows);
		buy.setB_type(b_type);
		buy.setB_name(b_name);
		List<Buys> buys = buyDao.findBuy3(buy);
		Integer count = buyDao.findBuy3Count(buy);
		Page<Buys> result = new Page<>();
		result.setPage(page);
		result.setRows(buys);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}
	
	@Override
	public void addsell(Integer user_id, String b_name, Double b_sell, String b_text, String type, String bimg) {
		this.buyDao.addsell(user_id, b_name, b_sell, b_text, type, bimg);
	}
	
	@Override
	public void delete(Integer bid) {
		this.buyDao.delete(bid);
	}
	
	@Override
	public void change(Integer b_id, String b_name, Double b_sell, String b_text, String option, String path) {
		this.buyDao.change(b_id, b_name, b_sell, b_text, option, path);
	}
	
}
