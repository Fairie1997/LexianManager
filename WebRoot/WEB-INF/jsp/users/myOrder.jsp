<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html >
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>我的订单</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
    <link href="css/style4.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/main.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/carts.css">
     <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/main.css" />
      
        <script type="text/javascript" src="js/jquery-3.3.1.min.js" ></script>
        <script type="text/javascript" src="js/bootstrap.min.js" ></script>
        <script type="text/javascript" src="js/cart.js"></script>
      
        <meta http-equiv="Content-Type" content="text/css; charset=UTF-8">
</head>
<script>
var o_no;
</script>
<body>
	
	
   <section class="cartMain">
   	<br />
   		<c:forEach items="${orderUserVoList}" var="orderUserVo">
   		<div id="${orderUserVo.o_no}">
   	<p style="margin-left: 200px;">门店名称：${orderUserVo.getSto_name()}</p>
   	<p style="margin-right: 200px;margin-top: -38px;" class="float-right">订单编号：${orderUserVo.o_no}</p>
        <div class="cartMain_hd" style="margin-left: 200px;">
            <ul class="order_lists cartTop">
                <li>商品</li>
                <li class="list_con">商品信息</li>               
                <li class="list_price">单价</li>
                <li class="list_amount">数量</li>
                <li class="list_sum">金额</li>
                <li class="list_delete"><input  type="button" onclick="deletebtn(this)" value="移除订单" id="${orderUserVo.o_no}" style="border: none; background: none; cursor: pointer; font-size: 15px;color: #0000C6;">
                	</li>
               	
            </ul>
        </div>

        <div class="cartBox" style="width: 800px;margin-left: 200px;">

               
            <div class="order_content">
            <c:forEach items="${orderUserVo.getOrdersUserComListVo()}" var="ordersUserComListVo">
            <ul class="order_lists">
                   
                    <li class="list_con">
                        <div class="list_img"><a href="commodity.jsp"><img src="${ordersUserComListVo.getPictureurl()}" alt=""></a></div>
                        <div class="list_text"><a href="commodity.jsp">${ordersUserComListVo.getCom_name()}</a></div>
                    </li>
                    
                    <li class="list_price">
                        <p class="price">${ordersUserComListVo.getListprice()}</p>
                    </li>
                    <li class="list_amount">
                        <p style="margin-top: 20px;">${ordersUserComListVo.getAmount()}</p>
     
                    </li>
                    <li class="list_sum">
                        <p class="sum_price">${ordersUserComListVo.getOi_totalprice()}</p>
                    </li>
                    
                    
                    
                </ul>
              </c:forEach>
   
                <li class="float-right">订单状态：${orderUserVo.o_states}</li>
                	<li class="float-right">总金额：${orderUserVo.totalamount}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                  <br><br> 
            </div>
        </div>
        </div>
  </c:forEach>
   
     </section>  
     <div class="modal fade" id="deleteCommodity" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">确认要删除吗？</h4>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button id="delete" type="button" class="btn btn-danger"
							data-dismiss="modal">删除</button>
					</div>
				</div>
			</div>
		</div>
     
      
</body>
<script>
function deletebtn(str){
	o_no = $(str).attr('id')
	$("#deleteCommodity").modal()
}
	$(function() {
		function deletebtn(str){
			$("#deleteCommodity").modal()
		}
		$('#delete').click(function() {
			var json = [];
			var j = {};
			j.o_no = o_no;
			json.push(j);

			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath }/deleteOrder.action",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(json),
				dataType : "json",
				success : function(result) {
					document.getElementById(o_no).innerHTML = "";
				},
				error : function(result) {
					alert("删除失败!");
				}
			});
		});
	}) 
</script>
</html>