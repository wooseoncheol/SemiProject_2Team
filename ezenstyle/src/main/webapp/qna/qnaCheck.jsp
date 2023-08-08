<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qdao" class="com.ezenstyle.qna.QnaDAO"></jsp:useBean>
<%
String id =(String)session.getAttribute("sid");
String pwd=qdao.qnaCheck(id);
String idx=request.getParameter("aaa");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#idcp{
margin-left: 50px;
margin-top: 40px;
}
#idcth1{
font-size: 20px;
font-weight: bold;
padding-bottom: 30px;
}
#idcb{
width: 150px;
height: 50px;
border-style: solid;
border-top: 0px;
border-left: 0px;
border-right: 0px;
border-color: #898989;
}

.btn1{
margin-left:5px;
width:70px;
height:28px;
background-color: white;
border-style: solid;
border-top-color:#E7E7E7;
border-left-color:#E7E7E7;
border-bottom-color: #E7E7E7;
border-right-color: #E7E7E7;
border-radius: 5px;
}
</style>
</head>
<body>
<div id="idcp">
<form name="qnaCheck" method="post" action="qnaCheck_ok.jsp">
	<table>
		<tr>
		<td id="idcth1">비밀번호를 입력하세요</td>
		</tr>
		<tr>
		<td>비밀번호 : <input type="password" name="pwd" Placeholder="비밀번호"></td>
		<td><input type="hidden" name="pwd2" value="<%=pwd %>"></td>
		<td><input type="hidden" name="idx" value="<%=idx %>"></td>
		<td><input class="btn1" type="submit" value="확인"></td>
		</tr>
	</table>
</form>
</div>

</body>
</html>