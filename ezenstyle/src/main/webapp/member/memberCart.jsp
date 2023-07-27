<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.member.*"%>
<%
request.setCharacterEncoding("utf-8");
String sid=(String)session.getAttribute("sid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/semiLayout.css">
<style>
img{
	width: 150px;
	height: 200px;
	margin-right: -80px;
}
.blind {
  position: absolute;
  width: 1px;
  height: 1px;
  clip: rect(0 0 0 0);
  overflow: hidden;
}
table{
	width:800px;
	height:130px;
	margin:0px auto;
}
table td{
	font-size:18px;
}
h3{
	margin-left:15px;
}
.btn1{
width:30px;
height:30px;
background-color:white;
border-style: none;
border-top-color:#E7E7E7;
border-left-color:#E7E7E7;
border-bottom-color: #E7E7E7;
border-right-color: #E7E7E7;
border-radius: 7px;
cursor: pointer;
color:gray;
padding-top: -10px;
}
.btn1:hover{
	color:black;
}
.btn2{
width:200px;
height:50px;
background-color:light-gray;
border-style: solid;
border-top-color:#E7E7E7;
border-left-color:#E7E7E7;
border-bottom-color: #E7E7E7;
border-right-color: #E7E7E7;
border-radius: 7px;
cursor: pointer;
font-size:20px;
margin-right:50px;
}
</style>
</head>
<body>
<%
if(sid==null){
	%>
	<script>
		window.alert('로그인 후 이용 가능');
		location.href='/ezenstyle/member/memberLogin.jsp';
	</script>
	<% 
	return;
}
%>
<%@include file="../header.jsp" %>
<section>
	<article id="art1">
		<h3>장바구니</h3>
		<table>
		<caption class="blind" >장바구니 목록</caption>
			<tr>
				<td rowspan="3"><img src="/ezenstyle/img/shoes/s1.jpg"></td>
				<td colspan="2">Yellow T-shirts</td>
				<td rowspan="3" align="right">가격:200000</td>
				<td align="right"><input type="button" value="X" class="btn1"></td>
			</tr>
			<tr>
				<td colspan="2" >shoes/trainers</td>
				<td></td>
			</tr>
			<tr>
				<td>사이즈:Free</td>
				<td>수량:2</td>
				<td></td>
			</tr>
		</table>
		<table>
			<tr align="center">
			<td><input type="button" value="계속 쇼핑하기" class="btn2" onclick="javascript:location.href='/ezenstyle/main.jsp'"></td>
			<td><input type="button" value="결제하기" class="btn2"></td>
			</tr>
		</table>
	</article>
</section>
<%@ include file="../footer.jsp" %>
</body>
</html>