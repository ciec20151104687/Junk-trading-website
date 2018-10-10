package com.itheima.core.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itheima.common.utils.Page;
import com.itheima.core.po.User;
import com.itheima.core.service.BuyService;
import com.itheima.core.service.UserService;

@Controller
public class MineController {
	@Autowired
	private UserService userService;
	@Autowired
	private BuyService buyService;
	/**
	 */
	@RequestMapping(value="/mine.action",method= RequestMethod.POST)
	public String mine(Model model,HttpSession session) {
		User use = (User) session.getAttribute("USER_SESSION");
		User user = userService.findMine(use.getUser_id());
		if(user != null) {
			session.setAttribute("MINE_SESSION", user);
			session.setAttribute("USER_SESSION", user);
			return "mine";
		}
		return "customer";
	}
	@RequestMapping(value="/mine.action",method= RequestMethod.GET)
	public String tomine(Model model,HttpSession session) {
		User use = (User) session.getAttribute("USER_SESSION");
		User user = userService.findMine(use.getUser_id());
		if(user != null) {
			session.setAttribute("MINE_SESSION", user);
			return "mine";
		}
		return "customer";
	}
	
	@RequestMapping(value="/mylist.action",method= RequestMethod.POST)
	public String mylist(Model model,HttpSession session) {
		User use = (User) session.getAttribute("USER_SESSION");
		List<User> user = userService.findmylist(use.getUser_id());
		model.addAttribute("MYLIST", user);
		return "list";
	}
    
    @RequestMapping(value="/changeusertel.action",method= RequestMethod.POST)
	public String changeUserTel(String tel,HttpSession session) {
		User user = (User) session.getAttribute("USER_SESSION");
		userService.changeUsertel(user.getUser_id(), tel);
		session.invalidate();
		return "redirect:login.action";
	}
	
	@RequestMapping(value="/changeuserpwd.action",method= RequestMethod.POST)
	public String changeUserPwd(String pwd, HttpSession session) {
		User user = (User) session.getAttribute("USER_SESSION");
		userService.changeUserpwd(user.getUser_id(), pwd);
		session.invalidate();
		return "redirect:login.action";
	}
	
	@RequestMapping(value="/mysell.action",method= RequestMethod.POST)
	public String mySell(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="12")Integer rows, Model model,HttpSession session) {
		User use = (User) session.getAttribute("USER_SESSION");
		Page<User> user = userService.findMySell(use.getUser_id(), page, rows);
		if(user != null) {
			model.addAttribute("buylist", user);
			return "mysell";
		}
		return "customer";
	}
	
	@RequestMapping(value = "/mysell.action",  method = RequestMethod.GET)
	public String toLogin(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="12")Integer rows, Model model, HttpSession session) {
		User use = (User) session.getAttribute("USER_SESSION");
		Page<User> user = userService.findMySell(use.getUser_id(), page, rows);
		if(user != null) {
			model.addAttribute("buylist", user);
			return "mysell";
		}
		return "mysell";
	}
	
	@RequestMapping(value="/addsell.action", method= RequestMethod.POST)
	public String addSell(String b_name, Double b_sell, String b_text, MultipartFile b_img, String option, Model model ,HttpSession session, HttpServletRequest request) throws IllegalStateException, IOException{
		User user = (User) session.getAttribute("USER_SESSION");
		if( !option.equals("——请选择——")) {
			ServletContext sc = request.getSession().getServletContext();  
	        String originalFilename = b_img.getOriginalFilename();
	        String bimg = b_name + "_" +originalFilename;
	        String path = sc.getRealPath("/upload") + "/" +bimg;
	        String pathsql = "upload/" + bimg;
	        File targetFile = new File(path);
	        System.out.println(path);
	        b_img.transferTo(targetFile);
			buyService.addsell(user.getUser_id(), b_name, b_sell, b_text, option, pathsql);
			return "redirect:mysell.action";
		}
		model.addAttribute("msg", "请选择商品类型！");
		return "mysell";
	}
	
	@RequestMapping(value="/deletee.action", method= RequestMethod.POST)
	public String delete(String b_id, Model model ,HttpSession session) {
		System.out.println(b_id);
		Integer bid = Integer.valueOf(b_id);
		buyService.delete(bid);
		return "redirect:mysell.action";
		
	}
	
	@RequestMapping(value="/changee.action", method= RequestMethod.POST)
	public String change(Integer b_id, String b_name, MultipartFile b_img, Double b_sell, String b_text, String option, HttpSession session,HttpServletRequest request) throws IllegalStateException, IOException {
		System.out.println(b_id);
		System.out.println(b_name);
		System.out.println(option);
		System.out.println(b_sell);
		System.out.println(b_text);
		System.out.println(b_img);
		ServletContext sc = request.getSession().getServletContext();  
        String originalFilename = b_img.getOriginalFilename();
        String bimg = b_name + "_" +originalFilename;
        String path = sc.getRealPath("/upload") + "/" +bimg;
        String pathsql = "upload/" + bimg;
        File targetFile = new File(path);
        System.out.println(path);
        b_img.transferTo(targetFile);
		buyService.change(b_id, b_name, b_sell, b_text, option, pathsql);	
		return "redirect:mysell.action";
		
	}

	@RequestMapping(value="/recharge.action",method= RequestMethod.POST)
	public String recharge(String recharge,HttpSession session) {
		User use = (User) session.getAttribute("USER_SESSION");
		User user = userService.findMine(use.getUser_id());
		float rec = user.getUser_money() + Float.parseFloat(recharge);
		userService.recharge(user.getUser_id(), rec);
		return "redirect:mine.action";
	}
	
	 
}
