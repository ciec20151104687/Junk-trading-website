<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Shop Page- Ustora Demo</title>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">
    


	<script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

	<script>
		function telcheck(){
    		var tel = $("#tel").val();
    		if(tel==""){
    			alert("电话为空！")
        		return false;
   			}  
    		alert("修改成功，请重新登录！");
    		return true;
		}
		function pwdcheck(){
    		var pwd1 = $("#pwd1").val();
    		var pwd2 = $("#pwd").val();
    		if(pwd1!=(pwd2) || pwd1=="" || pwd2==""){
    			alert("两次密码不匹配！")
        		return false;
   			}  
    		alert("修改成功，请重新登录！");
    		return true;
		}
	</script>

  </head>
  <body>
    <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                </div>
                
                <div class="col-md-6">
                    <div class="header-right">
                        <ul class="list-unstyled list-inline">
                        	<li class="dropdown dropdown-small">
                                <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span class="key"><i class="fa fa-shopping-cart" style="color:red;"></i><span class="product-count">${USER_CAR_SIZE}</span>&nbsp&nbsp&nbsp&nbsp购物车</span><b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                	<c:forEach items="${USER_CAR}" var="car">
                                	<li>
                                		<div style="width: 150px; border: 0px;overflow: hidden;  white-space:nowrap">
						                 	<a>${car.b_name}</a>
						                </div>
						                <a>￥：${car.b_sell}  |  ${car.c_num}件	</a>
									</li>
									<hr>
							        </c:forEach>
                                    <li>
                                    	<form id="_carform" action="${pageContext.request.contextPath }/tocar.action" method="post" >
                                    		<input type="hidden" id="userid" name="userid" value="${USER_SESSION.user_id}">
                                    		<a onclick="document.getElementById('_carform').submit();">结算</a>
                                    	</form>
                                    </li>

                                </ul>
                            </li>
                            <li class="dropdown dropdown-small">
                                <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#">
                               		<span class="key">欢迎 :</span>
                                	<span class="value">${USER_SESSION.user_name} </span>
                               		<b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                    	<form id="_mineform" action="${pageContext.request.contextPath }/mine.action" method="post" >
                                    		<input type="hidden" id="userid" name="userid" value="${USER_SESSION.user_id}">
                                    		<a onclick="document.getElementById('_mineform').submit();">我的信息</a>
                                    	</form>
                                    </li>
                                    <li>
                                    	<form id="_mysellform" action="${pageContext.request.contextPath }/mysell.action" method="post" >
                                    		<input type="hidden" id="userid" name="userid" value="${USER_SESSION.user_id}">
                                    		<a onclick="document.getElementById('_mysellform').submit();">我的售卖</a>
                                    	</form>
                                    </li>
                                </ul>
                            </li>

                            <li class="dropdown dropdown-small">
                                <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span class="key">更多</span><span class="value">... </span><b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                     <li>
                                    	<form id="_form" action="${pageContext.request.contextPath }/customer.action" method="post" >
                                    		<input type="hidden" id="option" name="option" value="——请选择——">
                                    		<input type="hidden" id="optionfind" name="optionfind" value="">
                                    		<a onclick="document.getElementById('_form').submit();">主页</a>
                                    	</form>
                                    </li>
                                    <li><a href="${pageContext.request.contextPath }/logout.action">注销</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo">
                        <h1><img src="img/logo.png"></h1>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End site branding area -->
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>我的订单</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-content-right">
                        <div class="woocommerce">
                                <table cellspacing="0" class="shop_table cart">
                                    <thead>
                                        <tr>
                                            <th class="product-thumbnail">照片</th>
                                            <th class="product-name">名称</th>
                                            <th class="product-price">金额</th>
                                            <th class="product-quantity">时间</th>
                                            <th class="product-remove">管理</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${MYLIST}" var="list">
                                        <tr class="cart_item">
                                            <td class="product-thumbnail">
                                                <a><img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" src="${list.b_img}"></a>
                                            </td>

                                            <td class="product-name" width="500px">
                                                <a>${list.b_name} * ${list.c_num}</a>  
                                            </td>

                                            <td class="product-price">
                                                <span class="amount" >${list.b_sell} * ${list.c_num}</span> 
                                            </td>

                                            <td class="product-quantity">
                                            	<a>${list.l_time}</a>  
                                            </td>

                                            <td class="product-remove">
                                                <a title="Remove this item" class="remove" >×</a> 
                                            </td>

                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                        </div>                        
                    </div>                    
                </div>
            </div>
        </div>
    </div>


    <div class="footer-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="copyright">
                       <p>Copyright &copy; 2018.Company name All rights reserved.</p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="footer-card-icon">
                        <i class="fa fa-cc-discover"></i>
                        <i class="fa fa-cc-mastercard"></i>
                        <i class="fa fa-cc-paypal"></i>
                        <i class="fa fa-cc-visa"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
    
    <!-- jQuery sticky menu -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    
    <!-- jQuery easing -->
    <script src="js/jquery.easing.1.3.min.js"></script>
    
    <!-- Main Script -->
    <script src="js/main.js"></script>
  </body>
</html>
