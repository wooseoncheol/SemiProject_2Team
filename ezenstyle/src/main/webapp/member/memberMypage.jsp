<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name = "홍길동";
String id = "hong123";
String pwd = "1234";
String adr = "서울";
String tel = "010-1234-5678";
String email = "hong@naver.com"; 
 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/semiLayout.css">
<script>
function show(){
	document.write('123');
}
</script>
<style>
#w123{
float: left;
}
#e123{
width:500px;
float: left;
}
table{
margin : 0px auto;
text-align: center;
}
li{
list-style-type:none;
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<div id="w123">
<ul>
	<li>내 정보 보기 및 수정</li>
	<li>장바구니</li>
	<li>구매 내역</li>
</ul>
</div>

<div id="e123"> 
<table>
	<tr>
	<td>이름 </td><td>홍길동</td>
	</tr>
	<tr>
	<td>아이디 </td><td>hong123</td>
	</tr>
	<tr>
	<td colspan="2"><input type="button" value="상세정보" onclick="show();"></td>
	</tr>
	
	<tr>
	<td>비밀번호 </td><td>1234</td>
	</tr>
	<tr>
	<td>주소 </td><td>서울</td>
	</tr>
	<tr>
	<td>휴대전화 </td><td>010-1234-1234</td>
	</tr>
	<tr>
	<td>이메일 </td><td>hong@naver.com</td>
	</tr>

</table>
</div>

<div>
<h3>테스트</h3>
</div>

<div>
<h3>테스트</h3>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>