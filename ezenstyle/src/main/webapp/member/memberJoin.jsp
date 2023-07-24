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
<script>
function show(){
	window.open('idcheck.jsp','popup','width=570,height=200,top=400,left=1300');
}
</script>
</head>
<body>
<h1>회원가입</h1>
<section>
	<article>
		<form name="memberjoin" action="memberJoin_ok.jsp" method="post">
		<fieldset>
		<legend>회원가입</legend>
		<table>
		<tr>
			<td>이름 * <input type="text" name="name" required="required"></td>
		</tr>
		<tr>
			<td>아이디 * <input type="text" name="id" readonly="readonly">
					<input type="button" name="duid" value="중복검사" onclick="show()">
			</td>
		</tr>
		<tr>
			<td>비밀번호 * <input type="password" name="pwd" required="required"></td>
		</tr>
		<tr>
			<td>주소 * <input type="text" name="adr" required="required"></td>
		</tr>
		<tr>
			<td>휴대전화 * <input type="text" name="tel" required="required"></td>
		</tr>
		<tr>
			<td>이메일 * <input type="text" name="email" required="required"></td>
		</tr>
		<tr>
			<td><input type="submit" value="가입">
			</td>
		</tr>
		</table>
		</fieldset>
		</form>
	</article>
</section>

</body>
</html>