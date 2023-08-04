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
border-top:3px solid black;
border-bottom: 3px solid black;
border-left:3px solid black;
border-right:3px solid black;
box-shadow: 20px 20px 5px grey;

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
#subInput{
border-top: none;
	border-right: none;
	border-left: none;
	outline:none;
	font-size: 17px;
}


h3{
	margin-left: 50px;
	margin-bottom: 30px;
}
.btn2{
width:120px;
height:40px;
background-color:white;
border-style: solid;
border-top-color:#BDBDBD;
border-left-color:#BDBDBD;
border-bottom-color: #BDBDBD;
border-right-color: #BDBDBD;
border-radius: 7px;
cursor: pointer;
}
.btn3{
width:120px;
height:40px;
background-color:black;
color:white;
border-style: solid;
border-top-color:#BDBDBD;
border-left-color:#BDBDBD;
border-bottom-color: #BDBDBD;
border-right-color: #BDBDBD;
border-radius: 7px;
cursor: pointer;
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
				<th>제목 &nbsp;&nbsp;&nbsp;<input type="text" name="subject" value="L&nbsp;&nbsp;<%=subject %>" id="subInput">
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
			<td colspan="2" align="center"><input type="reset" value="다시작성" class="btn2">&nbsp;&nbsp;
			<input type="submit" value="완료" class="btn3"></td>
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