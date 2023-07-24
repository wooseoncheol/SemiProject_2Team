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
	<form name="noticeWrite" action="noticeWrite_ok.jsp">
		<table>
			<tr>
				<th>공지
				<input type="checkbox" name="announce" value="on">
				</th>
				<th>제목 <input type="text" name="subject"></th>
			</tr>
			<tr>
				<th colspan="2">내용</th>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="10" cols="55" name="content"></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="글쓰기"></td>
				<td><input type="reset" value="다시작성"></td>
			</tr>
		</table>
	</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>