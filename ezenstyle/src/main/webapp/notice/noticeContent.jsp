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
margin-right: auto;
margin-left: auto;
margin-top: 100px;
margin-bottom: 100px;
width: 700px;
border-collapse: collapse;

}

table thead {
height:50px;
}

table thead th {
border-bottom: 5px solid #F0F0F0;
text-align: left;
}

table tbody {
height: 200px;
}

table tbody td {
border-bottom: 5px solid #F0F0F0;
}

table tfoot {
height: 50px;
}
.a{
text-align: right;
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
			<thead>
			<tr>
				<th><%=dto.getSubject() %></th>
				<th class="b">작성날짜: <%=dto.getWritedate() %></th>
				<th class="a">조회수: <%=dto.getReadnum() %></th>
			</tr>
			</thead>
			<tfoot>
			<tr>
				<td colspan="3" align="center"><a href="noticeList.jsp">목록</a>
				&nbsp;&nbsp;&nbsp;&nbsp;<a href="noticeDelete.jsp?idx=<%=dto.getIdx()%>">삭제</a></td>
			</tr>
			</tfoot>
			<tbody>
			<tr>
				<td colspan="3"><%=dto.getContent().replaceAll("\n", "<br>") %></td>
			</tr>
			</tbody>
		</table>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>