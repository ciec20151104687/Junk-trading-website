<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">

    <head>

        <meta charset="utf-8">
        <title>Fullscreen Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="assets/css/reset.css">
        <link rel="stylesheet" href="assets/css/supersized.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script>
			function check(){
    			vvar username = $("#username").val();
    			var usercode = $("#usercode").val();
    			var password = $("#upwd").val();
    			var password1 = $("#upwd1").val();
    			var randomjsp = $("#randomjsp").val();
    			if(usercode=="" || password=="" || username==""){
    				alert("用户名、手机号或密码为空！");
        			return false;
   				} 
    			if(password!=password1){
    				alert("两次密码不一致！");
        			return false;
    			}
    			if(randomjsp == ""){
    				alert("请输入验证码！");
        			return false;
    			}
    			return true;
			}
		</script>
    </head>

    <body>

        <div class="page-container">
            <h1>Register</h1>
            <font color="red"><span id="message">${msg }</span></font>
            <form action="${pageContext.request.contextPath }/register.action" method="post" onsubmit="return check()">
                <input type="text" name="usercode" class="uname" placeholder="请输入手机号">
                <input type="text" name="username" class="uname" placeholder="请输入姓名">
                <input type="password" name="upwd1" class="upwd" placeholder="请输入密码">
                <input type="password" name="upwd" class="upwd" placeholder="请确认密码">
                <input type="text" name="randomjsp" class="uname" placeholder="请输入验证码">
                <img src="getVerify.action" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">
                <button type="submit">注册</button>
                <div class="error"><span>+</span></div>
            </form>
            <br>
            <a href="${pageContext.request.contextPath }/login.action">返回登录</a>
        </div>
        <br><br><br><br><br>
        <div align="center">Copyright &copy; 2018.Company name All rights reserved.</div>

        <!-- Javascript -->
        <script src="assets/js/jquery-1.8.2.min.js"></script>
        <script src="assets/js/supersized.3.2.7.min.js"></script>
        <script src="assets/js/supersized-init.js"></script>
        <script src="assets/js/scripts.js"></script>

    </body>

</html>