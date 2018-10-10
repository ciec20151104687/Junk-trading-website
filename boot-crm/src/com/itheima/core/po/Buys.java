package com.itheima.core.po;

import java.io.Serializable;

public class Buys implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer b_id;
	private Integer u_id;
	private String b_name;
	private String b_type;
	private String user_code;
	private String user_name;
	private String b_text;
	private Double b_sell;
	private String b_img;
	private Integer start;
	private Integer rows;

	public Integer getB_id() {
		return b_id;
	}
	public void setB_id(Integer b_id) {
		this.b_id = b_id;
	}
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_type() {
		return b_type;
	}
	public void setB_type(String b_type) {
		this.b_type = b_type;
	}
	public String getUser_code() {
		return user_code;
	}
	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getB_text() {
		return b_text;
	}
	public void setB_text(String b_text) {
		this.b_text = b_text;
	}
	public Double getB_sell() {
		return b_sell;
	}
	public void setB_sell(Double b_sell) {
		this.b_sell = b_sell;
	}
	public String getB_img() {
		return b_img;
	}
	public void setB_img(String b_img) {
		this.b_img = b_img;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
}
