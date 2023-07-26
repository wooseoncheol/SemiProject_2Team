<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.goods.*" %>

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
#img{
background-color: skyblue;
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
			<td rowspan="3" id= "img">사진</td>
			<td rowspan="3"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td colspan = "2">
			<ul>
			<li><input id= "title" type="text" value="상품이름" readonly class=g_inf></li>
			<li><input type="text" value="가격정보" readonly class=g_inf></li>
			<li><input type="text" value="색상정보" readonly class=g_inf></li>
			<li><input type="text" value="사이즈정보" readonly class=g_inf></li>
			<li><input type="text" value="상품재고" readonly class=g_inf></li>
			<li><input type="text" value="상세정보" readonly class=g_inf></li>
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