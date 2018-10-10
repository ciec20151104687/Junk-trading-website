package com.itheima.core.service;

import com.itheima.common.utils.Page;
import com.itheima.core.po.Buys;

public interface BuyService {
	public Page<Buys> findBuy1(String b_type, Integer page, Integer rows);

	public Page<Buys> findBuy2(String b_name, Integer page, Integer rows);

	public Page<Buys> findBuy3(String b_type, String b_name, Integer page, Integer rows);

	public void addsell(Integer user_id, String b_name, Double b_sell, String b_text, String type, String bimg);

	public void delete(Integer bid);

	public void change(Integer b_id, String b_name, Double b_sell, String b_text, String option, String path);
	
}
