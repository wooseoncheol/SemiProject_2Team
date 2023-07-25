<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/ezenstyle/css/semiLayout.css">
<style>
table {
margin: 0px auto;
text-align: center;
}

</style>
</head>
<%@include file="/header.jsp" %>
<body>
<section>
	<article>
	<form name="qnaWrite" action="qnaWrite_ok.jsp">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th colspan="2" align="center">내용</th>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="10" cols="55" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="완료">
				&nbsp;&nbsp;<input type="reset" value="다시작성"></td>
			</tr>
		</table>
	</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>