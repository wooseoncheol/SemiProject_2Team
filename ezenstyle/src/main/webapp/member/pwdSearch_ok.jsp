<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.member.*" %>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mdao" class="com.ezenstyle.member.MemberDAO"></jsp:useBean>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String tel=request.getParameter("tel");

boolean result=mdao.getUserPwd(id, name, tel);

if(!result){
	//회원 정보 일치하지 않음 -> 다시 시도 -> memberFind.jsp
	%>
	<script>
		window.alert('일치하는 회원 정보가 없습니다.다시 시도');
		location.href='memberFind.jsp';
	</script>
	<%
	return;
	
}else{
	// 모두 일치 -> 비밀번호 재설정
	response.sendRedirect("pwdReset.jsp?id="+id);
}

%>