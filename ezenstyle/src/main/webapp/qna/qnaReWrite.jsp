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
<% 
String subject=request.getParameter("subject");
String ref=request.getParameter("ref");
String lev=request.getParameter("lev");
String sunbun=request.getParameter("sunbun");
%>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
	<h3>문의게시판 답변 쓰기</h3>
	<form name="qnaReWrite" action="qnaReWrite_ok.jsp">
	<input type="hidden" name="ref" value=<%=ref %>>
	<input type="hidden" name="lev" value=<%=lev %>>
	<input type="hidden" name="sunbun" value=<%=sunbun %>>
		<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="subject" value="Re:)<%=subject %>">
		</tr> 
		<tr>
			<td colspan="2" align="center">내용</td>
		</tr>
		<tr>
		<td colspan="2"><textarea rows="10" cols="55" name="content"></textarea></td>
		</tr>
		<tr>
		<td colspan="2" align="center"><input type="reset" value="다시작성">&nbsp;&nbsp;
		<input type="submit" value="완료"></td>	
		</table>
	</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>