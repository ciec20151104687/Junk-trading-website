<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ustora Demo</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">
	
	<script type="text/javascript">
		function find(){
			if(<%=session.getAttribute("USER_SESSION")%> == null){
				alert("你未登陆，请先登陆！");
			}
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
                    <% if(session.getAttribute("USER_SESSION") != null) {%>
                        <ul class="list-unstyled list-inline">
                        	<li class="dropdown dropdown-small">
                                <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle"><span class="key"><i class="fa fa-shopping-cart" style="color:red;"></i><span class="product-count">${USER_CAR_SIZE}</span>&nbsp&nbsp&nbsp&nbsp购物车</span><b class="caret"></b></a>
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
                                <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle"><span class="key">欢迎 :</span><span class="value">${USER_SESSION.user_name} </span><b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                	<li>
                                    	<form id="_mylistform" action="${pageContext.request.contextPath }/mylist.action" method="post" >
                                    		<a onclick="document.getElementById('_mylistform').submit();">我的订单</a>
                                    	</form>
                                    </li>
                                    <li>
                                    	<form id="_mineform" action="${pageContext.request.contextPath }/mine.action" method="post" >
                                    		<a onclick="document.getElementById('_mineform').submit();">我的信息</a>
                                    	</form>
                                    </li>
                                    <li>
                                    	<form id="_mysellform" action="${pageContext.request.contextPath }/mysell.action" method="post" >
                                    		<a onclick="document.getElementById('_mysellform').submit();">我的售卖</a>
                                    	</form>
                                    </li>
                                </ul>
                            </li>

                            <li class="dropdown dropdown-small">
                                <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle"><span class="key">更多</span><span class="value">... </span><b class="caret"></b></a>
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
                        <%}else{ %>
                        <a style="float:right" href="${pageContext.request.contextPath }/login.action">登录</a>
                        <%} %>
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
                <div class="col-sm-6">
                	<div class="shopping-item">
                	<form action="${pageContext.request.contextPath }/customer.action" method="post" >
						<select id="option" name="option">
							<option>——请选择——</option>
							<option>  手  机        </option>
							<option>  电  脑	</option>
							<option>  书  籍	</option>
							<option>  家  电	</option>
						</select>	
						<input type="text" id="optionfind" name="optionfind" placeholder="搜索">
						<input type="submit" value="查询" onclick="return find()">
					</form>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End site branding area -->
    
    <div class="mainmenu-area">
        <div class="container">
            <div class="row">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div> 

            </div>
        </div>
    </div> <!-- End mainmenu area -->
    
    <div class="slider-area">
        	<!-- Slider -->
			<div class="block-slider block-slider4">
				<ul class="" id="bxslider-home4">
					<li>
						<img src="img/h4-slide.png" alt="Slide">
						<div class="caption-group">
							<h2 class="caption title">
								100%<span class="primary">正品<strong>保证</strong></span>
							</h2>
							<h4 class="caption subtitle">只做原装二手苹果手机</h4>
							<a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
						</div>
					</li>
					<li><img src="img/h4-slide2.png" alt="Slide">
						<div class="caption-group">
							<h2 class="caption title">
								开学季  <span class="primary">5折 <strong>优惠</strong></span>
							</h2>
							<h4 class="caption subtitle">学习、办公用品</h4>
							<a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
						</div>
					</li>
					<li><img src="img/h4-slide4.png" alt="Slide">
						<div class="caption-group">
						  <h2 class="caption title">
                              自营配件 <span class="primary">全新 <strong>二手正品</strong></span>
							</h2>
							<h4 class="caption subtitle">耳机、MP3等</h4>
							<a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
						</div>
					</li>
				</ul>
			</div>
			<!-- ./Slider -->
    </div> <!-- End slider area -->
    
    <div class="promo-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo1">
                        <i class="fa fa-refresh"></i>
                        <p></p>
                        <p>30天包退换</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo2">
                        <i class="fa fa-truck"></i>
                        <p></p>
                        <p>免手续费</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo3">
                        <i class="fa fa-lock"></i>
                        <p></p>
                        <p>用户隐私保证</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo4">
                        <i class="fa fa-gift"></i>
                        <p></p>
                        <p>新用户礼包</p>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End promo area -->

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
    </div> <!-- End footer bottom area -->
   

    <!-- jQuery sticky menu -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    
    <!-- jQuery easing -->
    <script src="js/jquery.easing.1.3.min.js"></script>
    
    <!-- Main Script -->
    <script src="js/main.js"></script>
    
    <!-- Slider -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bxslider.min.js"></script>
	<script type="text/javascript" src="js/script.slider.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
  </body>
</html>