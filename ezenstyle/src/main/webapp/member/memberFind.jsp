<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/ezenstyle/css/semiLayout.css">
<style>
#idsearch{
	margin-left: 150px;
	margin-top: 80px;
	margin-right: 170px;
	float: left;
}
#pwdsearch{
	margin-top: 50px;
	margin-right: 50px;
	float: left;
	margin-bottom: 50px;
}
th{
	text-align: center;
}
#se{
	padding-bottom: 50px;
}
#a{
	width:350px;
	border-style: solid;
	outline:none;
	border-top: 0px;
	border-left: 0px;
	border-right: 0px;
	border-bottom: ;
	border-color: #898989;
	font-size: 17px;
}
#b{
	width:350px;
	height:35px;
	background-color:white;
	border-style: solid;
	border-top-color:#E7E7E7;
	border-left-color:#E7E7E7;
	border-bottom-color: #E7E7E7;
	border-right-color: #E7E7E7;
	border-radius: 7px;
	cursor: pointer;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<form name="idsearch" action="idSearch_ok.jsp" method="post">
	<table id="idsearch">
		<tr>
			<th align="center" id="se">아이디 찾기</th>
		</tr>
		<tr>
			<td>USER NAME</td>
		</tr>
		<tr>
			<td><br><input type="text" name="name" id="a"></td>
		</tr>
		<tr>
			<td><br>PHONE NUMBER</td>
		</tr>
		<tr>
			<td><br><input type="text" name="tel" id="a"></td>
		</tr>
		<tr>
			<td><br><br><input type="submit" value="아이디 찾기"  id="b">
		</tr>
	</table>
</form>
<form name="pwdsearch" action="pwdSearch_ok.jsp" method="post">
	<table id="pwdsearch">
		<tr>
			<th align="center" id="se">비밀번호 찾기</th>
		</tr>
		<tr>
			<td>USER ID</td>
		</tr>
		<tr>
			<td><br><input type="text" name="id" id="a"></td>
		</tr>
		<tr>
			<td><br>USER NAME</td>
		</tr>
		<tr>
			<td><br><input type="text" name="name" id="a"></td>
		</tr>
		<tr>
			<td><br>PHONE NUMBER</td>
		</tr>
		<tr>
			<td><br><input type="text" name="tel" id="a"></td>
		</tr>
		<tr>
			<td><br><br><input type="submit" value="비밀번호 찾기" id="b">
		</tr>
	</table>
</form>

<%@include file="/footer.jsp" %>
</body>
</html>