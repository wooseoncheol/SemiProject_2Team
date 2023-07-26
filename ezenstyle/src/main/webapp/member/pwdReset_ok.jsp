<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.member.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mdao" class="com.ezenstyle.member.MemberDAO"></jsp:useBean>
<%
String id=request.getParameter("id");
String pwdre=request.getParameter("pwdre");
String pwdrecheck=request.getParameter("pwdrecheck");

String msg="";

if(pwdre.equals(pwdrecheck)){ // 비밀번호와 비밀번호확인이 일치하지 않을 경우 다시 재설정
	
	int result=mdao.pwdReset(id, pwdre);
	msg=result>0?"비밀번호가 변경되었습니다.":id+pwdre+pwdrecheck;

}else{
	%>
	<script>
		window.alert('비밀번호가 일치하지 않습니다');
		location.href='pwdReset.jsp?id=<%=id %>';
	</script>
	<%
}

%>
<script>
	window.alert('<%=msg %>');
	location.href='memberLogin.jsp?id="<%=id %>"';
</script>