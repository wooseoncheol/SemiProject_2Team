<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String userid = (String)session.getAttribute("sid");
if(userid.equals("")|| userid==null){
	return ;
}
String checkpwd=request.getParameter("checkpwd");//사용자가 입력한 비밀번호
%>
<jsp:useBean id="ddao" class="com.ezenstyle.member.MemberDAO"> </jsp:useBean>
<%
String pwd=ddao.pwdDelete(userid);//사용자의 비밀번호
String msg="";
int result=0;
if(pwd.equals(checkpwd)){
		result = ddao.memberDel(userid);
		msg = "";
	if(result > 0){
		msg = "회원탈퇴가 처리되었습니다.";
		session.invalidate();
	}
	else{
		msg = "회원탈퇴에 실패했습니다.";
	}
}else{
		msg="비밀번호가 일치하지 않습니다.";
}
%>

<script>
window.alert('<%=msg %>');
<%
if(result>0){
%>
location.href='/ezenstyle/main.jsp';
<%
}else{
%>
location.href='/ezenstyle/member/memberDel.jsp';
<%
}
%>
</script>  

