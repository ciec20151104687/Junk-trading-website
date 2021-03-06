<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/" %>
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

        
    <script type="text/javascript">
    function show(id){
		var ID = id;
		$('#myModal'+ID).modal(); 
    	
    };
    function showchange(id){
		var ID = id;
		$('#changesell'+ID).modal(); 
    	
    }
    function deletee(){
    	var c = confirm('您确定要删除该商品吗？');
    	if(c == true){
    		return true;
    	}else{
    		return false;
    	}
    };
    function changee(){
    	var c = confirm('您确定要修改该商品吗？');
    	if(c == true){
    		return true;
    	}else{
    		return false;
    	}
    };
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
                                <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span class="key">欢迎 :</span><span class="value">${USER_SESSION.user_name} </span><b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                	<li>
                                    	<form id="_mylistform" action="${pageContext.request.contextPath }/mylist.action" method="post" >
                                    		<a onclick="document.getElementById('_mylistform').submit();">我的订单</a>
                                    	</form>
                                    </li>
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
                <div class="col-sm-6">
                	<div class="shopping-item"> 
                		<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">新建商品</button>      		
                		<form action="${pageContext.request.contextPath}/addsell.action" method="post" enctype="multipart/form-data">
                			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  				<div class="modal-dialog">
                  					<div class="modal-content">
                  						<div class="modal-header">
                   			 				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                   			            	<h4 class="modal-title" id="myModalLabel">新建商品</h4>
                   			         	</div>
                   			         	<div class="modal-body">
                   			         	<div class="single-shop-product">
                   			         		<table>
                								<tr>
                 		  							<td>商品名称：</td>
                    		  						<td><input type="text" id="b_name" name="b_name" ></td>
                								</tr>
                								<tr><td>&nbsp;</td></tr>
                								<tr>
                 		  							<td>商品价格：</td>
                    		  						<td><input type="text" id="b_sell" name="b_sell" ></td>
                								</tr>
                								<tr><td>&nbsp;</td></tr>
                								<tr>
                 		  							<td>商品类型：</td>
                    		  						<td>
                    		  						<select id="option" name="option">
														<option>——请选择——</option>
														<option>  手  机        </option>
														<option>  电  脑	</option>
														<option>  书  籍	</option>
														<option>  家  电	</option>
													</select>
													</td>
                								</tr>
                								<tr><td>&nbsp;</td></tr>
                								<tr>
                 		  							<td>商品照片：</td>
                    		  						<td><input type="file" id="b_img" name="b_img"></td>
                								</tr>
                								<tr><td>&nbsp;</td></tr>
												<tr>
													<td>详细介绍：</td>
													<td><textarea rows="5" cols="40" id="b_text" name="b_text"></textarea></td>
												</tr>
                							</table>
                   			         	</div>
                   			         	</div>
                   			         	<div class="modal-footer">
                      			        	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                      			        	<button type="submit" class="btn btn-primary">新建</button>
                     			       </div>
                   			    	</div>
                   				</div>
                			</div>
                		</form>
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
                        <h2>我的售卖</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
				<c:forEach items="${buylist.rows}" var="buys">
                <div class="col-md-3 col-sm-6">
                    <div class="single-shop-product">
                    	<div style="width:100%;height:400px">
	                        <div class="product-upper">
	                            <img src="${buys.b_img}" onclick="show(${buys.b_id})" style="cursor:pointer;">
	                        </div>
	                        <h2><a onclick="show(${buys.b_id})">${buys.b_name}</a></h2>
	                        <div class="product-carousel-price">
	                            <ins>￥：${buys.b_sell}</ins>
	                        </div>  
	                        </div>
                        <div>
                            <button class="btn btn-primary" onclick="showchange(${buys.b_id })" style="float:right">修改</button>      		
	                		<form action="${pageContext.request.contextPath}/changee.action" method="post" enctype="multipart/form-data">
	                			<input type="hidden" id="b_id" name="b_id" value="${buys.b_id}" >
	                			<div class="modal fade" id='changesell${buys.b_id }' tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                  				<div class="modal-dialog">
	                  					<div class="modal-content">
	                  						<div class="modal-header">
	                   			 				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                   			            	<h4 class="modal-title" id="myModalLabel">新建商品</h4>
	                   			         	</div>
	                   			         	<div class="modal-body">
	                   			         	<div class="single-shop-product">
	                   			         		<table>
	                								<tr>
	                 		  							<td>商品名称：</td>
	                    		  						<td><input type="text" id="b_name" name="b_name" value="${buys.b_name }"></td>
	                								</tr>
	                								<tr><td>&nbsp;</td></tr>
	                								<tr>
	                 		  							<td>商品价格：</td>
	                    		  						<td><input type="text" id="b_sell" name="b_sell" value="${buys.b_sell }"></td>
	                								</tr>
	                								<tr><td>&nbsp;</td></tr>
	                								<tr>
	                 		  							<td>商品类型：</td>
	                    		  						<td>
	                    		  						<select id="option" name="option">
															<option>${buys.b_type }</option>
															<option>  手  机        </option>
															<option>  电  脑	</option>
															<option>  书  籍	</option>
															<option>  家  电	</option>
														</select>
														</td>
	                								</tr>
	                								<tr><td>&nbsp;</td></tr>
	                								<tr>
	                 		  							<td>商品照片：</td>
	                    		  						<td><input type="file" id="b_img" name="b_img"></td>
	                								</tr>
	                								<tr><td>&nbsp;</td></tr>
													<tr>
														<td>详细介绍：</td>
														<td><textarea rows="5" cols="40" id="b_text" name="b_text">${buys.b_text }</textarea></td>
													</tr>
	                							</table>
	                   			         	</div>
	                   			         	</div>
	                   			         	<div class="modal-footer">
	                      			        	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	                      			        	<button type="submit" class="btn btn-primary" onclick="return changee()">修改</button>
	                     			       </div>
	                   			    	</div>
	                   				</div>
	                			</div>
	                		</form>
	                		<form action="${pageContext.request.contextPath}/deletee.action" method="POST">
                            	<input type="hidden" id="b_id" name="b_id" value="${buys.b_id}" >
                            	<button class="btn btn-default" style="background-color:red;color:white;float:right" onclick="return deletee()">删除</button>
                            </form>
                        </div>             
                    </div>
                    <div class="modal fade" id='myModal${buys.b_id}' tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                    <h4 class="modal-title" id="myModalLabel">${buys.b_name}</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="single-product-area">
                                         <div class="zigzag-bottom"></div>
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-md-8">
                                                        <div class="product-content-right">
                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <div class="product-images">
                                                                        <div class="product-main-img">
                                                                            <img src="${buys.b_img }" alt="">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                
                                                                <div class="col-sm-5">
                                                                    <div class="product-inner">
                                                                        <h2 class="product-name">${buys.b_name}</h2>
                                                                        <div class="product-inner-price">
                                                                            <ins>￥：${buys.b_sell }</ins> 
                                                                        </div>    
                                                                        <div>
                                                                          	卖家：${buys.user_name}
                                                                          	电话：${buys.user_code}
                                                                          	<hr>
                                                                        </div>   
                                                                        <div role="tabpanel">
                                                                            <div class="tab-content">
                                                                                <div role="tabpanel" class="tab-pane fade in active" id="home">
                                                                                    <h2>介绍</h2>  
                                                                                    <p>${buys.b_text}</p>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                	</div>
                                <div class="modal-footer">
                                	<button type="submit" class="btn btn-default" data-dismiss="modal">取消</button>
                                </div>
                            </div>
                        </div>
                    </div>

				</div>   
	            </c:forEach>
            </div>   
            <div class="row">
                <div class="col-md-12">
                    	<itheima:page url="${pageContext.request.contextPath}/mysell.action"/>
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