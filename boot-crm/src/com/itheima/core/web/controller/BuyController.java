package com.itheima.core.web.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itheima.common.utils.Page;
import com.itheima.core.po.Buys;
import com.itheima.core.po.User;
import com.itheima.core.service.BuyService;

@Controller
public class BuyController {
	@Autowired
	private BuyService buyService;

	@RequestMapping(value="/customer.action",method= RequestMethod.POST)
	public String buy(String option, String optionfind, Model model,HttpSession session, @RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="12")Integer rows) throws UnsupportedEncodingException {	
		Page<Buys> buys = null;
		option = URLDecoder.decode(option, "utf-8");
		optionfind = URLDecoder.decode(optionfind, "utf-8");
		System.out.println(option+"   "+optionfind);
		User use = (User) session.getAttribute("USER_SESSION");
		if(use != null) {
			if( !option.equals("——请选择——") && optionfind.equals("")) {
				buys = buyService.findBuy1(option, page, rows);
			}else if(option.equals("——请选择——") && !optionfind.equals("")){
				optionfind = "%" + optionfind + "%";
				buys = buyService.findBuy2(optionfind, page, rows);
			}else if(!option.equals("——请选择——") && !optionfind.equals("")){
				optionfind = "%" + optionfind + "%";
				buys = buyService.findBuy3(option,optionfind, page, rows);
			}
			if(buys != null) {
				model.addAttribute("buylist", buys);
				return "menu";		
			}
			model.addAttribute("msg","请重新选择！");
			return "customer";
		}
		return "login";
	}
	
	@RequestMapping(value="/customer.action",method= RequestMethod.GET)
	public String buy1(String option, String optionfind, Model model,HttpSession session, @RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="12")Integer rows) throws UnsupportedEncodingException{	
		Page<Buys> buys = null;
		option = URLDecoder.decode(option, "utf-8");
		optionfind = URLDecoder.decode(optionfind, "utf-8");
		System.out.println(option+"   "+optionfind);
		User use = (User) session.getAttribute("USER_SESSION");
		if(use != null) {
			if( !option.equals("——请选择——") && optionfind.equals("")) {
				buys = buyService.findBuy1(option, page, rows);
			}else if(option.equals("——请选择——") && !optionfind.equals("")){
				optionfind = "%" + optionfind + "%";
				buys = buyService.findBuy2(optionfind, page, rows);
			}else if(!option.equals("——请选择——") && !optionfind.equals("")){
				optionfind = "%" + optionfind + "%";
				buys = buyService.findBuy3(option,optionfind, page, rows);
			}
			if(buys != null) {
				model.addAttribute("buylist", buys);
				return "menu";		
			}
			model.addAttribute("msg","请重新选择！");
			return "customer";
		}
		return "login";
	}
	
}
