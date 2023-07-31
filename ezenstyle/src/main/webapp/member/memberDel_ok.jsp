<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String userid = (String)session.getAttribute("sid");
if(userid.equals("")|| userid==null){
	return ;
}
%>
<jsp:useBean id="ddao" class="com.ezenstyle.member.MemberDAO"> </jsp:useBean>

<%
int result = ddao.memberDel(userid);
String msg = "";
if(result > 0){
	msg = "잘가..";
	session.invalidate();
}
else{
	msg = "탈퇴실패 ㅋ";
}

%>

<script>
window.alert('<%=msg %>');
location.href='/ezenstyle/main.jsp';
</script>  

