
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<script src="jquery.slim.min.js"></script>
		<script src="popper.min.js"></script>
		<script src="js/bootstrap.js"></script>
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/main.css">
		
		 <style>
            /*web background*/
            .container{
                display:table;
                height:100%;
            }
 
            /* centered columns styles */
            .row-centered {
                text-align:center;
            }
            .col-centered {
                display:inline-block;
                float:center;
                text-align:justify;
               
                display: flex;
			/*控制元素在主轴的对齐方式*/
			justify-content: center;
			/*控制默认的一行的对齐方式*/
			align-items: center;
			margin: 0 auto;

               
            }
        </style>
        
		<title>管理员注册</title>
	</head>
	<body>
		
		<div class="jumbotron text-center" style="background-image: url(img/regBack.png);">
			<h2 style="margin-left: -60px;">管理员注册</h2>
		</div>
		
		<div class="container">
			<div class="col-centered">
			<div class="card" style="width:650px" >
				<div class="card-body">
					<h3 class="card-title">注册</h3>
					<form id="RegisterForm" action="${pageContext.request.contextPath }/Mregister.action" method="post">
				        <div class="form-group">
				            <label for="name">手机号：</label>
				            <input type="number" class="form-control" id="phone" name="phe" placeholder="手机号">
				        </div>
				        <div class="form-group">
				            <label for="pwd">密码：</label>
				            <input type="password" class="form-control" id="pwd" name="pwd" placeholder="密码">
				        </div>
				        <div class="form-group">
				            <label for="checkpwd">确认密码：</label>
				            <input type="password" class="form-control" id="checkpwd" placeholder="确认密码">
				        </div>
				        <div class="form-group">
				            <label for="num">商店ID：</label>
				            <input type="number" class="form-control" id="num" name="sto_no" placeholder="商店编号">
				        </div>
				        <div class="form-check">
					    <br/><br/>
				        </div>
				        <button type="submit" class="btn btn-primary">注册</button>
				        <a href="returnLogin.action" type="button" class="btn btn-primary">返回</a>
				        <p>${fail }</p>
					</form>
				</div>
			</div>
			</div>
		</div>
		<br/><br/><br/><br/><br/><br/>
	</body>
</html>