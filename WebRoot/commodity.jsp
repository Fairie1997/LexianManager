<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="utf-8">
         
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>乐鲜生活</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/main.css" />
        
        <script type="text/javascript" src="js/jquery-3.3.1.min.js" ></script>
        <script type="text/javascript" src="js/bootstrap.min.js" ></script>
        
        <meta http-equiv="Content-Type" content="text/css; charset=UTF-8">
  
        <style>
        	div>input{
 
}
div>label{
    position: relative;
    margin-right: 34px;
    font-size: larger;
}
div>label::before{
    display: inline-block;
    content: "";
    width: 16px;
    height: 16px;
    border-radius: 50%;
    border: 1px solid rgb(219, 219, 219);
    margin-right: 6px;
    vertical-align: bottom;
}
div>input:checked+label::before{
    background-color: rgb(239, 66, 56);
}
div>input:checked+label::after{
    display: inline-block;
    content: "";
    width: 6px;
    height: 6px;
    border-radius: 50%;
    position: absolute;
    left: 5px;
    bottom: 5px;
    background-color:white;
  
}
.form-control{
	width: 200px;height: 60px;border-color: #C82333;border-width:medium;margin-top: 30px;
	text-align:center;
	font-size:larger;
}
        	figure,.card {
        		margin-left: 100px;
        		margin-top: 50px;
        	 }
        h2，h1{
        	margin-left: 70px;
        	margin-top: 70px;
        	
        }
        .top{
        	margin-top: 35px;
        	 margin-left: 50px;
        }
        body{
        	background: #EFEFEF;
        }
        span{
        	font-size:larger;
        }
       
        </style>
    </head>
    <body>
 
    
    	<div class = "header">
    	<nav class="navbar navbar-expand-sm bg-danger navbar-dark" >
  <form class="form-inline" style="margin-left: 1200px;" >
    <input class="form-control" type="text" placeholder="Search">
    <button class="btn btn-warning" type="button">Search</button>
  </form>
</nav>
    	</div>
	<div class="row">
		<div class=col-lg-4>
			<figure class="figure ">
				<img src="img/lamer.jpg" class="img-responsive"
					alt="Responsive image" alt="A ."
					style="width: 600px; margin-left: 0;">
				<figcaption class="figure-caption">lamer.</figcaption>
			</figure>
		</div>

		<div class="card card-inverse "
			style="margin-left: 200px; width: 800px; height: 600px;">
			<div class="card-block">
				<div class=" row top">
					<div class="col-lg-6">
						<h1 id="name">
							海蓝之谜
							</h2>
					</div>
				</div>
				<div class=" row top">
					<div class="col-lg-6">
						<h3>
							价格：<span class="text-danger">¥</span><span
								class="cprice text-danger" id="price">2500</span>
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

					</div>
					<div id="Comment" class="container tab-pane fade">
						<br>
						<!--
      	门店
      -->

					</div>

				</div>

				<div class="row top">

					<div class="col-lg-6">
						<h4>选择门店</h4>
						<hr class="m-lg-12">

						<input type="radio" name="paixu" id="paixu1" checked="checked"
							style="display: none;"> <label for="paixu1"
							style="cursor: pointer;">门店一</label> <input type="radio"
							name="paixu" id="paixu2" style="display: none;"> <label
							for="paixu2" style="cursor: pointer">门店二</label> <input
							type="radio" name="paixu" id="paixu3" style="display: none;">
						<label for="paixu3" style="cursor: pointer">门店三</label>
					</div>
				</div>
			</div>

			<div class="row top">

				<div class="input-group input-group-sm col-lg-4 ">
					<span class="input-group-btn">
						<button class="btn btn-warning btn-lg" id="btn_decre"
							type="button" onclick="decre()">-</button>
					</span> <input type="text" value="1" style="width: 60px;" id="am"
						name="am" style="display: inline;"> <span
						class="input-group-btn">
						<button class="btn btn-warning btn-lg" id="btn_incre"
							type="button" onclick="add()">+</button>
					</span>
				</div>
				<button type="submit" class="btn btn-danger btn-lg col-lg-4">加入购物车</button>
			</div>



		</div>
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
 	 	</body>
</html>