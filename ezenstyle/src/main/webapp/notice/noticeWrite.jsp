<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/ezenstyle/css/semiLayout.css">
<style>
.a {
padding-top: 80px;
padding-bottom: 80px;
}
table {
border-top: 1px solid;
border-bottom: 1px solid;
margin: 0px auto;
width: 600px;
height: 300px;
text-align: center;
border-collapse: collapse;
}

table td {
border-top: 1px solid;
border-bottom: 1px solid;
}
.input {

outline: none;
box-sizing: 300px;
}

</style>
</head>
<%@include file="/header.jsp" %>
<body>
<section>
	<article>
	<form class="a" name="noticeWrite" action="noticeWrite_ok.jsp">
		<table>
			<tr>
				<th>공지 <input class="input" type="checkbox" name="announce" value="on"> </th>
				<th>제목</th>
				<td><input class="input" type="text" name="subject"> </td>
			</tr>
			<tr>
				<th>내용</th>
			</tr>
			<tr>
				<td colspan="3"><textarea rows="10" cols="80" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="3"><input type="reset" value="다시작성">&nbsp;&nbsp;
				<input type="submit" value="완료"></td>
			</tr>
		</table>
	</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>