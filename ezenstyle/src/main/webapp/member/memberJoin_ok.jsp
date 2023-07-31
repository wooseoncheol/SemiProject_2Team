<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	request.setCharacterEncoding("UTF-8");   
%>
    
<jsp:useBean id="mdto" class="com.ezenstyle.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.ezenstyle.member.MemberDAO"></jsp:useBean>

<%
String msg="";
String pwd1 = request.getParameter("pwd1");
String pwd = request.getParameter("pwd");
if(pwd.equals(pwd1)){
	int count = mdao.memberInsert(mdto);
	msg = count > 0? "가입축 ㅋ":"가입실패!";
}else{
	msg="비밀번호가 다릅니다";
}

%>

<script>
window.alert('<%=msg %>');
location.href='/ezenstyle/member/memberLogin.jsp';
</script>   