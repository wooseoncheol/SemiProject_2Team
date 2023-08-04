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
margin-top: 40px;
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
height: 200px;
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

input[type=reset] {
background: none;
border: 1px solid gray;
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
</head>
<%@include file="/header.jsp" %>
<body>
<section>
	<article>
	<form name="qnaWrite" action="qnaWrite_ok.jsp">
	<h3>1:1 문의글 쓰기</h3>
		<table>
		<%
		String id=(String)session.getAttribute("sid");
		%>
		<input type="hidden" name="id" value="<%=id %>">
		<thead>
			<tr>
				<th>제목 : &nbsp;&nbsp;<input type="text" name="subject" id="subInput" required="required">
				<%Calendar now=Calendar.getInstance();
					int y=now.get(Calendar.YEAR);
					int m=now.get(Calendar.MONTH)+1;
					int d=now.get(Calendar.DATE);
					String date=y+"년 "+m+"월 "+d+"일"; 
				%>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;날짜: <%=date %></th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="2" align="center" style="padding-bottom: 20px;padding-top:20px;"><input type="reset" value="다시작성" class="btn2">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="완료" class="btn3"></td>
			</tr>
		</tfoot>
		<tbody>
			<tr>
				<td colspan="2"><textarea placeholder="내용을 입력하세요." rows="10" cols="55" name="content" required="required"></textarea></td>
			</tr>
		</tbody>
		</table>
	</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>