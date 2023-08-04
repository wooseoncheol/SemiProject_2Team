<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.qna.*" %>
<%@ page import="com.ezenstyle.member.*" %>
<jsp:useBean id="qdao" class="com.ezenstyle.qna.QnaDAO"></jsp:useBean>
<jsp:useBean id="mdao" class="com.ezenstyle.member.MemberDAO"></jsp:useBean>
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
String idx_s=request.getParameter("idx");
if(idx_s==null||idx_s.equals("")){
	idx_s="0";
}
int idx=Integer.parseInt(idx_s);
QnaDTO dto=qdao.qnaContent(idx);
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
					<th><%=dto.getWritedate() %></th>
					<th><%=dto.getId() %></th>
				</tr>
			<thead>
			<tbody>
			<tr>
				<td colspan="3"><%=dto.getContent().replaceAll("\n", "<br>") %></td>
			</tr>
			</tbody>
			<tfoot>
			<tr>
				<td colspan="3" align="center"><a href="qnaList.jsp">목록</a>
				<%
				String admin=(String)session.getAttribute("sid");
				if (admin==null||admin.equals("")) {
					admin="";
				} else {
					int result2=mdao.adminPage(admin);
					if (result2>0) {
						%>
						&nbsp;&nbsp;<a href="qnaReWrite.jsp?subject=<%=dto.getSubject()%>&ref=<%=dto.getRef()%>&lev=<%=dto.getLev() %>&sunbun=<%=dto.getSunbun()%>">답변쓰기</a>
						&nbsp;&nbsp;<a href="qnaDelete.jsp?idx=<%=dto.getIdx()%>">삭제</a>
						<%
					} else {
						%>
						&nbsp;&nbsp;<a href="qnaDelete.jsp?idx=<%=dto.getIdx()%>">삭제</a>
						<%
					}
				}
				%>
				</td>
			</tr>
			</tfoot>
		</table>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>