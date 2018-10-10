<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cart Page - Ustora Demo</title>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript">
		function up(id){
			var number = parseInt($("#number"+id).val());
			number = number + 1;
			$("#number"+id).val(number);
			
			var price = parseFloat($("#price"+id).val());
			var name = $("#name"+id).val();
			var allprice = parseFloat($("#Allprice").val());
			var text = $("#text").val();
			name = name+",";
			if (document.getElementById("checkbox"+id).checked){
				if(text.indexOf(name)!=-1){
					allprice = allprice + price;
					$("#Allprice").val(allprice);
				}
			}
			
			var req_data={};
        	req_data["c_num"]=number;
        	req_data["c_id"]=id;
        	fajax("${pageContext.request.contextPath}/numchange.action",req_data,function(data){
    		})
		}
		function down(id){
			var number = parseInt($("#number"+id).val());
			if(number > 1){
				number = number - 1;
				$("#number"+id).val(number);
				var price = parseFloat($("#price"+id).val());
				var name = $("#name"+id).val();
				var allprice = parseFloat($("#Allprice").val());
				var text = $("#text").val();
				name = name+",";
				if (document.getElementById("checkbox"+id).checked){
					if(text.indexOf(name)!=-1){
						allprice = allprice - price;
						$("#Allprice").val(allprice);
					}
				}
				var req_data={};
	        	req_data["c_num"]=number;
	        	req_data["c_id"]=id;
	        	fajax("${pageContext.request.contextPath}/numchange.action",req_data,function(data){
	    		})
			}
			else{
				alert("已经是最小数量，无法减少！！！")
			}
		}
		function checkbox(id){
			var number = parseFloat($("#number"+id).val());
			var price = parseFloat($("#price"+id).val());
			var name = $("#name"+id).val();
			var allprice = parseFloat($("#Allprice").val());
			var text = $("#text").val();
			var sum = number*price;
			name = name+",";
			if (document.getElementById("checkbox"+id).checked){
				if(text.indexOf(name)==-1){
					allprice = allprice + sum;
					$("#Allprice").val(allprice);
					text = text + name;
					$("#text").val(text);
				}
			}else{
				if(text.indexOf(name)!=-1){
					allprice = allprice - sum;
					$("#Allprice").val(allprice);
					text = text.replace(name,"");
					$("#text").val(text);
				}
			}
		}
		function delet(id){
        	var Id = id;
        	fajax("${pageContext.request.contextPath}/clearcar.action?id="+id,null,function(data){
        	})
        	self.location.reload();
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
                                <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#">
                               		<span class="key">欢迎 :</span>
                                	<span class="value">${USER_SESSION.user_name} </span>
                               		<b class="caret"></b>
                                </a>
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
                        <h1><a href="./"><img src="img/logo.png"></a></h1>
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
                        <h2>购物车</h2>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End Page title area -->
    
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-content-right">
                        <div class="woocommerce">
                            <form action="${pageContext.request.contextPath }/mycar.action" method="post">
                                <table cellspacing="0" class="shop_table cart">
                                    <thead>
                                        <tr>
                                        	<th class="product-name">选择</th>
                                            <th class="product-thumbnail">照片</th>
                                            <th class="product-name">名称</th>
                                            <th class="product-price">单价</th>
                                            <th class="product-quantity">数量</th>
                                            <th class="product-remove">管理</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${USER_CAR}" var="car">
                                        <tr class="cart_item">
                                            <td class="product-name">
                                                 <input type="checkbox" onclick="checkbox(${car.c_id})" id='checkbox${car.c_id}' >
                                            </td>
                                            <td class="product-thumbnail">
                                                <a><img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" src="${car.b_img}"></a>
                                            </td>

                                            <td class="product-name" width="500px">
                                                <a>${car.b_name}</a>  
                                                <input type="hidden" id='name${car.c_id}' value="${car.c_id}">
                                                 
                                            </td>

                                            <td class="product-price">
                                                <span class="amount" >${car.b_sell}</span> 
                                                <input type="hidden" id='price${car.c_id}' value="${car.b_sell}">
                                            </td>

                                            <td class="product-quantity">
                                                <div class="quantity buttons_added">
                                                    <input type="button" class="minus" value="-" onclick="down(${car.c_id})">
                                                    <input type="number" id='number${car.c_id}' name='number${car.c_id}' size="4" class="input-text qty text" title="Qty" value="${car.c_num}" min="0" step="1"  readonly="readonly">
                                                    <input type="button" class="plus" value="+" onclick="up(${car.c_id})">
                                                </div>
                                            </td>

                                            <td class="product-remove">
                                                <a title="Remove this item" class="remove" onclick="return delet(${car.c_id})">×</a> 
                                            </td>

                                        </tr>
                                        </c:forEach>
                                        <tr>
	                                        
	                                        <td></td>
	                                        <td></td>
	                                        <td></td>
	                                        <td>合计：</td>
                                        	<td>
                                        		 <input type="hidden" id="text" name="text" value="">
                                                 <input type="number" id="Allprice" name="Allprice" size="4" class="input-text qty text" title="Qty" value="0" readonly="readonly">
                                            </td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div style="float:right">
                                	<input type="submit" class="btn btn-primary btn-lg" style="background-color: red" value="结算">
                                </div>
                            </form>
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
    
    <!-- Latest jQuery form server -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    
    <!-- Bootstrap JS form CDN -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    <!-- jQuery sticky menu -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    
    <!-- jQuery easing -->
    <script src="js/jquery.easing.1.3.min.js"></script>
    
    <!-- Main Script -->
    <script src="js/main.js"></script>
    
    <!-- Slider -->
    <script type="text/javascript" src="js/bxslider.min.js"></script>
	<script type="text/javascript" src="js/script.slider.js"></script>
  </body>
</html>