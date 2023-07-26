<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.member.*" %>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mdto" class="com.ezenstyle.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.ezenstyle.member.MemberDAO"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/ezenstyle/css/semiLayout.css">
<style>
table{
	margin: 100px auto;
}
#a{
	height:150px;
	width:400px;
	margin: 0px auto;
}
table th{
	width:400px;
	border-style: solid;
	outline:none;
	border-top: ;
	border-left: 0px;
	border-right: 0px;
	border-bottom: ;
	border-color: #898989;
	font-size: 17px;
	font-weight: normal;
}
table a{
	font-weight: bold;
}
table td input{
	width:400px;
	height:35px;
	background-color:white;
	border-style: solid;
	border-top-color:#E7E7E7;
	border-left-color:#E7E7E7;
	border-bottom-color: #E7E7E7;
	border-right-color: #E7E7E7;
	border-radius: 7px;
	cursor: pointer;
}
#b{
	margin-top:30px;
	margin-bottom: 30px;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<form>
	<table>
		<tr>
			<th id="a">
				<%
				String result=mdao.getUserId(mdto.getName(), mdto.getTel());
				if(result==null){
					out.println("이름 또는 전화번호가 틀렸습니다.");
				}
				else{
					%> <%=mdto.getName()%>님의 아이디는 <a><%=result%></a>입니다.<%
				}
				%>
			</th>
		</tr>
		<tr>
			<td><input type="button" value="LOGIN" onclick="location.href='memberLogin.jsp'" id="b">
		</tr>
		<tr>
			<td><input type="button" value="비밀번호 찾기" onclick="location.href='memberFind.jsp'">
		</tr>
	</table>
</form>
<%@include file="/footer.jsp" %>
</body>
</html>