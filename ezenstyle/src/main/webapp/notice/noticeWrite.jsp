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
padding-left: 70px;

}

table tbody {
text-align: center;
height: 200px;
}

table tbody td {
border-bottom: 5px solid #F0F0F0;
}

table tfoot {
text-align: center;
height: 50px;
}
.a{
text-align: right;
}
.input {
outline: none;
box-sizing: 300px;
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
</head>
<%@include file="/header.jsp" %>
<body>
<section>
	<article>
	<form class="a" name="noticeWrite" action="noticeWrite_ok.jsp">
		<table>
			<thead>
			<tr>
				<th>공지&nbsp;<input class="input" type="checkbox" name="announce" value="on">
				&nbsp;&nbsp;&nbsp;&nbsp;제목&nbsp;&nbsp;<input class="input" type="text" name="subject"></th>
			</tr>
			</thead>
			<tfoot>
			<tr>
				<td colspan="3"><input type="reset" value="다시작성">&nbsp;&nbsp;
				<input type="submit" value="완료"></td>
			</tr>
			</tfoot>
			<tbody>
			<tr>
				<td colspan="3"><textarea placeholder="내용을 입력하세요." rows="10" cols="80" name="content"></textarea></td>
			</tr>
			</tbody>
		</table>
	</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>