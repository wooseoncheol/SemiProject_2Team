<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.goods.*" %>
<jsp:useBean id="idao" class="com.ezenstyle.goods.GoodsDAO"></jsp:useBean>
<%
String idx_s = request.getParameter("idx"); 
int idx = Integer.parseInt(idx_s); 
GoodsDTO dto = idao.showGoodscontent(idx);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section table{
width: 800px;
margin: 0px auto;
}
section li{
list-style-type:none;
width: 300px;
margin: center;
line-height: 50px;
font-size:15px;
}
#title{
font-size: 30px;
}
img{

width: 500px;
height: 600px; 
}
#button1{
text-align: center;
margin-left:15px;
width:150px;
height:50px;
background-color: white;
border-style: solid;
border-top-color:#E7E7E7;
border-left-color:#E7E7E7;
border-bottom-color:#E7E7E7;
border-right-color: #E7E7E7;
background-color: black;
color : white;
}
#button2{
text-align: center;
margin-left:15px;
width:150px;
height:50px;
background-color: white;
border-style: solid;
border-top-color:#E7E7E7;
border-left-color:#E7E7E7;
border-bottom-color:#E7E7E7;
border-right-color: #E7E7E7;
border-radius: 5px;
}
.g_inf{
border: 0px;
outline:none;
}
</style>
<link rel="stylesheet" type="text/css" href="../css/semiLayout.css">
</head>
<body>
<%@include file = "../header.jsp" %>
<section>
<form fm = "fm" action = "/ezenstyle/orderInput.jsp" >
<table>
		<tr>
			<td rowspan="3" id= "img"><img src="/ezenstyle/goods/imgs/<%=dto.getG_nfile() %>"></td>
			<td rowspan="3"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td colspan = "2">
			<ul>
			<li><input id= "title" type="text" value="<%=dto.getG_name() %>" readonly class=g_inf></li>
			<li><input type="text" value="가격: : <%=dto.getG_price() %>" readonly class=g_inf></li>
			<li><input type="text" value="색상: : <%=dto.getG_color() %>" readonly class=g_inf></li>
			<li><input type="text" value="사이즈: : <%=dto.getG_size() %>" readonly class=g_inf></li>
			<li><input type="text" value="상품재고" readonly class=g_inf></li>
			<li><input type="text" value="상세정보 : <%=dto.getG_detail() %>" readonly class=g_inf></li>
			</ul>
			</td>
		</tr>
		<tr>
			<td ><input id="button1"type = "submit" value = "바로구매"></td>
			<td ><input id="button2" type = "button" value = "장바구니"></td>
		</tr>
		<tr>
			<td> &nbsp; </td>
			<td> &nbsp; </td>
		</tr>
	</table>
</form>
</section>
<%@include file = "../footer.jsp" %>
</body>
</html>