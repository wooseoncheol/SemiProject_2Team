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
</head>
<body>
<%@include file="/header.jsp" %>
<%
String result=mdao.getUserId(mdto.getName(), mdto.getTel());
if(result==null){
	out.println("이름 또는 전화번호가 틀렸습니다.");
}
else{
	%> <%=mdto.getName()%>님의 아이디는 <%=result%>입니다.<%
}
%>
<%@include file="/footer.jsp" %>
</body>
</html>