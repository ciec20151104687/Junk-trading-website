package com.itheima.core.web.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itheima.common.utils.RandomValidateCode;
import com.itheima.core.po.User;
import com.itheima.core.service.UserService;

@Controller
public class UserController {
	//依赖注入
	@Autowired
	private UserService userService;
	/**
	 * 用户登录
	 */
	@RequestMapping(value="/login.action",method= RequestMethod.POST)
	public String login(String uname,String upwd, Model model,HttpSession session) {
		User user = userService.findUser(uname, upwd);
		if(user != null) {
			List<User> user_car = (List<User>) userService.findUserCar(user.getUser_id());
			session.setAttribute("USER_SESSION", user);
			session.setAttribute("USER_CAR",user_car);
			session.setAttribute("USER_CAR_SIZE", user_car.size());
			return "customer";
		}
		model.addAttribute("msg","账号或密码错误请重新输入！");
		return "login";
	}
	
	/**
	 * 模拟其他类中跳转到客户管理页面的办法
	 */
	@RequestMapping(value="/toCustomer.action")
	public String toCustomer() {
		return "customer";
	}
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login.action";
	}
	
	/**
	 * 向用户登录、注册页面跳转
	 */
	@RequestMapping(value = "/login.action",  method = RequestMethod.GET)
	public String toLogin() {
//		System.out.println("login");
		return "login";
	}
	@RequestMapping(value = "/toregister.action",method= RequestMethod.GET)
	public String toRegister() {
//		System.out.println("register");
		return "register";
	}
	@RequestMapping(value = "/tofindpwd.action",method= RequestMethod.GET)
	public String tofindpwd() {
//		System.out.println("findpwd");
		return "findpwd";
	}
	@RequestMapping(value = "/tocar.action",method= RequestMethod.POST)
	public String tocar() {
//		System.out.println("car");
		return "car";
	}
	@RequestMapping(value = "/tocar.action",method= RequestMethod.GET)
	public String tocar2() {
//		System.out.println("car");
		return "car";
	}
	/**
	 * 验证码图片
	 */
	@RequestMapping(value = "/getVerify.action")
    public void getVerify(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
        response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response);//输出验证码图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    /**
     * 验证登录
     * @param model
     * @param userName
     * @param password
     * @param inputStr
     * @param session
     * @return
     */
    @RequestMapping(value = "/register.action", method = RequestMethod.POST)
    public String register(Model model, String username, String upwd,String randomjsp, String usercode, HttpSession session) {
        //从session中获取随机数
    	Integer user_State = 1;
        String random = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
        if(random.equals(randomjsp)) {
        	User user = userService.findUser(username, upwd);
        	if(user != null) {
        		model.addAttribute("msg","用户已存在，请重新输入！");
    			return "register";
    		}
    		userService.addUser(username,upwd,usercode,user_State);
    		model.addAttribute("msg","用户注册成功，请登录！");
    		return "login";
        }
        model.addAttribute("msg","验证码错误，请重新输入！");
		return "register";
    }
    
    @RequestMapping(value = "/findpwd.action", method = RequestMethod.POST)
    public String findpwd(Model model, String username, String upwd,String randomjsp, String usercode, HttpSession session) {
        //从session中获取随机数
        String random = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
        if(random.equals(randomjsp)) {
        	User user = userService.findpwdUser(username, usercode);
        	if(user == null) {
        		model.addAttribute("msg","用户不存在，请重新输入！");
    			return "findpwd";
    		}else {
    			userService.findpwd(upwd,usercode);
    			model.addAttribute("msg","密码重置成功，请登录！");
    			return "login";
    		}
        }
        model.addAttribute("msg","验证码错误，请重新输入！");
		return "findpwd";
    }
    
    @RequestMapping(value = "/numchange.action", method = RequestMethod.POST)
    public void numchange(Model model, int c_id, int c_num, HttpSession session) {
        //从session中获取随机数
    	userService.numchange(c_id, c_num);
    	User user = (User) session.getAttribute("USER_SESSION");
    	List<User> user_car = (List<User>) userService.findUserCar(user.getUser_id());
    	session.setAttribute("USER_CAR", user_car);
    	session.setAttribute("USER_CAR_SIZE", user_car.size());
    }
    
    @RequestMapping(value = "/clearcar.action", method = RequestMethod.POST)
    public void clearcar(Model model, int id, HttpSession session) {
        //从session中获取随机数
    	userService.clearcar(id);
    	User user = (User) session.getAttribute("USER_SESSION");
    	List<User> user_car = (List<User>) userService.findUserCar(user.getUser_id());
    	session.setAttribute("USER_CAR", user_car);
    	session.setAttribute("USER_CAR_SIZE", user_car.size());
    }
    
    @RequestMapping(value = "/addcar.action", method = RequestMethod.POST)
    public void addcar(Model model, int id, int num, HttpSession session) {
        //从session中获取随机数
    	User user = (User) session.getAttribute("USER_SESSION");
    	User user_f = userService.findUserOldCar(user.getUser_id(),id);
    	if(user_f != null) {
    		System.out.println(user_f.getC_num());
    		num = num + user_f.getC_num();
    		userService.updatecar(id,num,user.getUser_id());
    	}else {
    		userService.addcar(id,num,user.getUser_id());
    	}
    	List<User> user_car = (List<User>) userService.findUserCar(user.getUser_id());
    	session.setAttribute("USER_CAR", user_car);
    	session.setAttribute("USER_CAR_SIZE", user_car.size());
    }
    
	@RequestMapping(value="/mycar.action", method= RequestMethod.POST)
	public String mycar(String text, String Allprice, Model model ,HttpSession session) {
		User user = (User) session.getAttribute("USER_SESSION");
		System.out.println(text);
		if(text != null || text != "") {
			String[] str =  text.split(",");
			float price = Float.parseFloat(Allprice);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			userService.addlist(user.getUser_id(),price,df.format(new Date()));
			userService.addlist_money(user.getUser_id(),price);
			User user_l = userService.findlist(user.getUser_id(),price,df.format(new Date()));
			int i = str.length;
			for(int j=0;j<i;j++) {
				userService.carlist(user.getUser_id(),user_l.getL_id(),str[j]);
			}
		}
		User use = userService.findMine(user.getUser_id());
		List<User> user_car = (List<User>) userService.findUserCar(user.getUser_id());
		session.setAttribute("USER_SESSION", use);
    	session.setAttribute("USER_CAR", user_car);
    	session.setAttribute("USER_CAR_SIZE", user_car.size());
    	return "redirect:tocar.action";
	}


}






