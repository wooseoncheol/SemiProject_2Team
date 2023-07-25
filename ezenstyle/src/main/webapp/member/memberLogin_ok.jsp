<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="logindao" class="com.ezenstyle.member.MemberDAO" ></jsp:useBean>

<%
request.setCharacterEncoding("utf-8");
String userid = request.getParameter("userid");
String userpwd = request.getParameter("userpwd");
String saveid=request.getParameter("saveid");

int result = logindao.loginCheck(userid, userpwd);

if(result==logindao.LOGIN_OK){
	
	if(saveid!=null){
		Cookie ck = new Cookie("saveid",userid);
		ck.setMaxAge(60*60*24*30);
		response.addCookie(ck);
	}else{
		Cookie ck = new Cookie("saveid",userid);
		ck.setMaxAge(0);//가자마자 죽임(삭제 구현)
		response.addCookie(ck);
	}
	
	String name = logindao.getUserInfo(userid);
	
	session.setAttribute("sid", userid);
	session.setAttribute("sname", name);
	
	
	%> 
	<script>
	window.alert('<%=name%>님 환영합니다~');
	location.href='/ezenstyle/main.jsp';
	</script>
	<%
	
}
%>
    