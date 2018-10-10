package com.itheima.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itheima.core.po.Buys;

public interface BuyDao {
	public void addsell(@Param("user_id") Integer user_id, @Param("b_name") String b_name, 
					@Param("b_sell") Double b_sell, @Param("b_text") String b_text,
					@Param("type") String type, @Param("bimg") String bimg);
	public void delete(@Param("bid") Integer bid);
	public void change(@Param("b_id") Integer b_id, @Param("b_name") String b_name, 
					@Param("b_sell") Double b_sell, @Param("b_text") String b_text, 
					@Param("option") String option, @Param("path") String path);
	public List<Buys> findBuy1(Buys buy);
	public Integer findBuy1Count(Buys buy);
	public List<Buys> findBuy2(Buys buy);
	public Integer findBuy2Count(Buys buy);
	public List<Buys> findBuy3(Buys buy);
	public Integer findBuy3Count(Buys buy);
}
