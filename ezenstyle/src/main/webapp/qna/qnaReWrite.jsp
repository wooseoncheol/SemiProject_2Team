<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
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
height:80px;
}

table thead th {
border-bottom: 5px solid #F0F0F0;
text-align: left;
padding-left: 70px;

}

table tbody {
text-align: center;
height: 250px;
}
table textarea {
width: 600px;
}
table tbody td {
border-bottom: 5px solid #F0F0F0;
}

table tfoot {
text-align: center;
height: 50px;
}
input[type=submit] {
background: none;
border: 1px solid gray;
}
input[type=reset] {
background: none;
border: 1px solid gray;
}
</style>
<% 
String subject=request.getParameter("subject");
String ref=request.getParameter("ref");
String lev=request.getParameter("lev");
String sunbun=request.getParameter("sunbun");
String id=(String)session.getAttribute("sid");
%>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
	<h3>문의게시판 답변 쓰기</h3>
	<form name="qnaReWrite" action="qnaReWrite_ok.jsp">
	<input type="hidden" name="id" value=<%=id %>>
	<input type="hidden" name="ref" value=<%=ref %>>
	<input type="hidden" name="lev" value=<%=lev %>>
	<input type="hidden" name="sunbun" value=<%=sunbun %>>
		<table>
		<thead>
			<tr>
				<th>제목 &nbsp;&nbsp;&nbsp;<input type="text" name="subject" value="L&nbsp;&nbsp;<%=subject %>">
				&nbsp;&nbsp;&nbsp;<%Calendar now=Calendar.getInstance();
					int y=now.get(Calendar.YEAR);
					int m=now.get(Calendar.MONTH)+1;
					int d=now.get(Calendar.DATE);
					String date=y+"년 "+m+"월 "+d+"일"; 
				%>
				&nbsp;&nbsp;&nbsp;&nbsp;날짜: <%=date %></th>
			</tr> 
		</thead>
		<tfoot>
			<tr>
			<td colspan="2" align="center"><input type="reset" value="다시작성">&nbsp;&nbsp;
			<input type="submit" value="완료"></td>
		</tr>
		</tfoot>
		<tbody>
			<tr>
			<td colspan="2"><textarea placeholder="내용을 입력하세요." rows="10" cols="55" name="content"></textarea></td>
			</tr>
		</tbody>	
		</table>
	</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>