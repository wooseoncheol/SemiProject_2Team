<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.notice.*" %>
<jsp:useBean id="ndao" class="com.ezenstyle.notice.NoticeDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/ezenstyle/css/semiLayout.css">
<style>
table {
margin: 0px auto;
width: 500px;
height: 150px;
}
td {
border-bottom: 1px solid gray;
}

</style>
</head>
<%
String readnum_s=request.getParameter("readnum");
String idx_s=request.getParameter("idx");
if(idx_s==null||idx_s.equals("")){
	idx_s="0";
}
int idx=Integer.parseInt(idx_s);
int readnum=Integer.parseInt(readnum_s);
ndao.noticeReadnum(idx, readnum);
NoticeDTO dto=ndao.noticeContent(idx);
if (dto==null) {
	%>
	<script>
		window.alert('작성된 게시글이 없습니다.');
	</script>
	<%
	return;
}
%>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<table>
			<tr>
				<td>제목: <%=dto.getSubject() %></td>
				<td>작성날짜: <%=dto.getWritedate() %></td>
				<td>조회수: <%=dto.getReadnum() %></td>
			</tr>
			<tr>
				<td colspan="3" align="center">본문</td>
			</tr>
			<tr>
				<td colspan="3"><%=dto.getContent().replaceAll("\n", "<br>") %></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><a href="noticeList.jsp">목록</a></td>
			</tr>
		</table>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>