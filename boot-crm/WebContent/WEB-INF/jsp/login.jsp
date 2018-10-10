<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    			var username = $("#uname").val();
    			var password = $("#upwd").val();
    			if(usercode=="" || password==""){
    				$("#message").text("用户名或密码为空！");
        			return false;
   				}  
    			return true;
			}
		</script>
    </head>

    <body>

        <div class="page-container">
            <h1>Login</h1>
            <font color="red"><span id="message">${msg }</span></font>
            <form action="${pageContext.request.contextPath }/login.action" method="post" onsubmit="return check()">
                <input type="text" name="uname" class="uname" placeholder="Username(telphone)">
                <input type="password" name="upwd" class="upwd" placeholder="Password">
                <button type="submit">登 录</button>
                <div class="error"><span>+</span></div>
            </form>
            <br>
            <a href="${pageContext.request.contextPath }/toregister.action">新用户注册</a> 
            <br> 
            <a href="${pageContext.request.contextPath }/tofindpwd.action">忘记密码</a>  
            <div class="connect">
                <p>Or connect with:</p>
                <p>
                    <a class="facebook" href=""></a>
                    <a class="twitter" href=""></a>
                </p>
            </div>
        </div>
        <div align="center">Copyright &copy; 2018.Company name All rights reserved.</div>

        <!-- Javascript -->
        <script src="assets/js/jquery-1.8.2.min.js"></script>
        <script src="assets/js/supersized.3.2.7.min.js"></script>
        <script src="assets/js/supersized-init.js"></script>
        <script src="assets/js/scripts.js"></script>

    </body>

</html>