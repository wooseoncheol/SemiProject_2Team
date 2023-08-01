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
	msg = "회원탈퇴가 처리되었습니다.";
	session.invalidate();
}
else{
	msg = "회원탈퇴에 실패했습니다.";
}

%>

<script>
window.alert('<%=msg %>');
location.href='/ezenstyle/main.jsp';
</script>  

