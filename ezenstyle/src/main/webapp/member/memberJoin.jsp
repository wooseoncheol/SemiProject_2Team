<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	request.setCharacterEncoding("UTF-8");   
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/semiLayout.css">
<style>
.div1{
height:450px;
width:450px;
padding-top:50px;
margin: 0px auto;
}
.a{
width:200px;
border-style: solid;
outline:none;
border-top: 0px;
border-left: 0px;
border-right: 0px;
border-bottom: ;
border-color: #898989;
font-size: 17px;
}
.btn1{
width:340px;
height:35px;
background-color: white;
border-style: solid;
border-top-color:#E7E7E7;
border-left-color:#E7E7E7;
border-bottom-color: #E7E7E7;
border-right-color: #E7E7E7;
border-radius: 7px;
cursor: pointer;
}
.btn2{
margin-left:15px;
width:80px;
height:28px;
background-color: white;
border-style: solid;
border-top-color:#E7E7E7;
border-left-color:#E7E7E7;
border-bottom-color: #E7E7E7;
border-right-color: #E7E7E7;
border-radius: 5px;
}
section article form table tr{
height: 55px;
}
.atr{
height: 80px;
}
.atd{
text-align: center;
}

</style>
<script>
function show(){
	window.open('idcheck.jsp','popup','width=570,height=200,top=400,left=1300');
}
</script>
</head>
<body>
<%@include file="../header.jsp" %>
<section>
	<article>
		<form name="memberjoin" action="memberJoin_ok.jsp" method="post">
		<div class="div1">
		<table>
		<tr>
			<td>이름 * </td><td>&nbsp;&nbsp;<input class="a" type="text" name="name" required="required"></td>
		</tr>
		<tr>
			<td>아이디 * </td><td>&nbsp;&nbsp;<input class="a" type="text" name="id" readonly="readonly"></td>
			<td>&nbsp;&nbsp;<input class="btn2" type="button" name="duid" value="중복검사" onclick="show()"></td>
		</tr>
		<tr>
			<td>비밀번호 * </td><td>&nbsp;&nbsp;<input class="a" type="password" name="pwd" required="required"></td>
		</tr>
		<tr>
			<td>주소 * </td><td>&nbsp;&nbsp;<input class="a" type="text" name="adr" required="required"></td>
		</tr>
		<tr>
			<td>휴대전화 * </td><td>&nbsp;&nbsp;<input class="a" type="text" name="tel" required="required"></td>
		</tr>
		<tr>
			<td>이메일 * </td><td>&nbsp;&nbsp;<input class="a" type="text" name="email" required="required"></td>
		</tr>
		<tr class="atr">
			<td colspan="3" class="atd"><input class="btn1" type="submit" value="가입">
			</td>
		</tr>
		</table>
		</div>
		</form>
	</article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>