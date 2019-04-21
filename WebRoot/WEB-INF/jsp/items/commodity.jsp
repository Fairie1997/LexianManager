<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>乐鲜生活</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/main.css" />
<link href="css/style1.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style4.css" rel="stylesheet" type="text/css" media="all" />


<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/css; charset=UTF-8">

<style>
div>input {
	
}

div>label {
	position: relative;
	margin-right: 34px;
	font-size: larger;
}

div>label::before {
	display: inline-block;
	content: "";
	width: 16px;
	height: 16px;
	border-radius: 50%;
	border: 1px solid rgb(219, 219, 219);
	margin-right: 6px;
	vertical-align: bottom;
}

div>input:checked+label::before {
	background-color: rgb(239, 66, 56);
}

div>input:checked+label::after {
	display: inline-block;
	content: "";
	width: 6px;
	height: 6px;
	border-radius: 50%;
	position: absolute;
	left: 5px;
	bottom: 5px;
	background-color: white;
}

.form-control {
	width: 200px;
	height: 60px;
	border-color: #C82333;
	border-width: medium;
	margin-top: 30px;
	text-align: center;
	font-size: larger;
}

figure, .card {
	margin-left: 100px;
	margin-top: 50px;
}

h2，h1 {
	margin-left: 70px;
	margin-top: 70px;
}

.top {
	margin-top: 35px;
	margin-left: 50px;
}

body {
	background: #EFEFEF;
}

span {
	font-size: larger;
}
</style>
</head>

<%
	String u_phone = (String) session.getAttribute("loginedUser");
	pageContext.setAttribute("u_phone", u_phone);
%>

<body>

	<div class="header ">
		<div class="container">
			<div class="head">
				<div class=" logo">
					<a href="index.jsp"><img src="img/logo.jpg" alt=""></a>
				</div>
			</div>
		</div>
		<div class="header-top" style="height: 60px;">
			<div class="container">
				<div class="col-sm-5 col-md-offset-2 header-login float-right ">
					<ul>
						<li><a href="index.jsp">首页</a></li>
						<li><a href="myHome.jsp">我的个人中心</a></li>
					</ul>
				</div>
				<div class="clearfix "></div>
			</div>

		</div>
	</div>
	<div class="row">
		<div class=col-lg-4>
			<figure class="figure "> <img
				src="${comDetail.getCommodityInfoVo().getPictureurl() }"
				class="img-responsive" alt="Responsive image" alt="A ."
				style="width: 600px; margin-left: 0;"> <figcaption
				class="figure-caption"></figcaption> </figure>
		</div>

		<div class="card card-inverse "
			style="margin-left: 200px; width: 800px; height: 200%;">
			<div class="card-block">
				<div class=" row top">
					<div class="col-lg-6">
						<h1 id="name">${comDetail.getCommodityInfoVo().getCom_name() }</h2>
					</div>
				</div>
				<div class=" row top">
					<div class="col-lg-6">

						<h3>
							价格：<span class="text-danger">¥</span><span
								class="cprice text-danger" id="price"></span>
							</h2>
					</div>
				</div>


				<div class=" row top">
					<div class="infotab">
						<ul class="nav nav-tabs nav-justified">
							<li class="nav-item col-lg-6"><a class="nav-link active"
								data-toggle="tab" href="#Info">商品详情</a></li>
							<li class="nav-item col-lg-6"><a class="nav-link"
								data-toggle="tab" href="#Comment">门店信息</a></li>

						</ul>
					</div>
				</div>

				<div class="tab-content">
					<div id="Info" class="container tab-pane active">
						<br>
						<!--
     	商品简介
     -->
						${comDetail.getCommodityInfoVo().getCom_name() }

					</div>
					<div id="Comment" class="container tab-pane fade">
						<br>
						<!--
      	门店
      -->

						<c:forEach items="${comDetail.getStoList()}" var="store"
							varStatus="status">
      门店${ status.index + 1} ${store.getSto_add() }  ${store.getSto_name() } 
    </br>
    <form action="${pageContext.request.contextPath }/stoMap.action" name="map" style="margin-bottom=20px;" method="post">
					<input type="hidden" name="longitude" value="${store.longitude }" /> 
					<input type="hidden" name="latitude" value="${store.latitude }" /> 
					<input type="hidden" name="com_no" value="${com_no }" />  
					<input type="hidden" name="sto_name" value="${ status.index + 1 }" />
					<input type="submit" class="btn btn-danger  " style="width:120px;height:40px;font-size=10px"  value="查看门店地址" />
					
				</form>
						</c:forEach>

						


					</div>

				</div>

				<div class="row top">

					<div class="col-lg-6">
						<h4>选择门店</h4>
						<hr class="m-lg-12">

						<c:forEach items="${comDetail.commodity_storeList}" var="com_sto"
							varStatus="status">

							<input type="radio" name="paixu" id="${com_sto.sto_no }"
								style="display: none;" value="${com_sto.com_price }"
								onchange="showPrice(this) ">
							<label for="${com_sto.getSto_no() }" style="cursor: pointer;">门店${ status.index + 1}
							</label>
						</c:forEach>
						<script>
							function showPrice(obj) {
								document.getElementById("price").innerHTML = obj.value;
								document.getElementById("listprice").value = obj.value;
								document.getElementById("sto_no").value = obj.id;
							}
						</script>
						<!-- <input type="submit" value="提交"/> -->


						<!--                <input type="radio" name="paixu" id="paixu1" checked="checked"style="display: none;" value="1">
                <label for="paixu1" style="cursor:pointer ;">门店一</label>
                <input type="radio" name="paixu" id="paixu2"style="display: none;">
                <label for="paixu2" style="cursor:pointer">门店二</label>
                <input type="radio" name="paixu" id="paixu3"style="display: none;">
                <label for="paixu3" style="cursor:pointer">门店三</label>  -->
					</div>
				</div>
			</div>

			<div class="row top">

				<div class="input-group input-group-sm col-lg-4 " style="">
					<span class="input-group-btn">
						<button class="btn btn-warning btn-lg" id="btn_decre"
							type="button" onclick="decre()">-</button>
					</span> <input type="text" value="1" style="width: 60px;" id="am"
						name="am" style="display: inline;"> <span
						class="input-group-btn">
						<button class="btn btn-warning btn-lg" id="btn_incre"
							type="button" onclick="add()">+</button>
					</span>
					<%--  ${comDetail.getCommodityInfoVo().getCom_no() } --%>
				</div>
				<form action="insertTrolley.action" name="commodity" style="margin-bottom=20px;">
					<input type="hidden" name="u_phone" value="${u_phone }" /> <input
						type="hidden" name="com_no"
						value="${comDetail.commodityInfoVo.com_no }" /> <input
						type="hidden" name="amount" id="amount" value="1" /> <input
						type="hidden" name="sto_no" id="sto_no" /> <input type="hidden"
						name="listprice" id="listprice" /> <input type="submit"
						class="btn btn-danger btn-lg col-lg-12" style="width:150%" value="加入购物车" />
					
				</form>

			</div>



		</div>
		<br>
	</div>
<script>
		function decre() {
			if (document.getElementById("am").value == 1) {
				$("#btn_decre").attr("disabled", true);
			} else {

				var valu = document.getElementById("am").value;

				valu--;
				document.getElementById("am").value = valu;

			}

		}

		function add() {
			if (document.getElementById("am").value == 1) {
				$('#btn_decre').removeAttr("disabled");
			}

			var val = document.getElementById("am").value;

			val++;
			document.getElementById("am").value = val;

		}
	</script>
	
	<!--过渡-->
	<div class="container">
		<div class="brand">
			<div class="clearfix"></div>
		</div>
	</div>
	<!--页脚-->
	<div class="footer">
		<center>
			<div class="footer-bottom">
				<p style="color: white;">乐鲜生活电子商城</p>
			</div>
		</center>
	</div>
	<!--页脚-->
</body>
</html>