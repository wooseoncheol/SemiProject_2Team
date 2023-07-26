<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.member.*" %>
<%
request.setCharacterEncoding("utf-8");
String sid=(String)session.getAttribute("sid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/semiLayout.css">
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
<%@include file="header.jsp" %>
<section>
	<article>
	<h3>상품정보</h3>
		<table>
			<tr>
				<td>이미지</td>
				<td>상품명</td>
				<td>수량</td>
				<td>가격</td>
			</tr>
		</table>
	</article>
</section>
<%@include file="footer.jsp" %>
</body>
</html>