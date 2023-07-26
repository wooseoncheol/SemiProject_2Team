<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/ezenstyle/css/semiLayout.css">
</head>
<body>
<%@include file="/header.jsp" %>
<form name="idsearch" action="idSearch_ok.jsp" method="post">
	<table>
		<tr>
			<th colspan="2" align="center">아이디 찾기</th>
		</tr>
		<tr>
			<td>NAME</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>PHONE</td>
			<td><input type="text" name="tel"></td>
		</tr>
		<tr>
			<td><input type="submit" value="아이디 찾기">
		</tr>
	</table>
</form>
<form name="pwdsearch" action="pwdSearch_ok.jsp" method="post">
	<table>
		<tr>
			<th colspan="2" align="center">비밀번호 찾기</th>
		</tr>
		<tr>
			<td>ID</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>NAME</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>PHONE</td>
			<td><input type="text" name="tel"></td>
		</tr>
		<tr>
			<td><input type="submit" value="비밀번호 찾기">
		</tr>
	</table>
</form>
<%@include file="/footer.jsp" %>
</body>
</html>