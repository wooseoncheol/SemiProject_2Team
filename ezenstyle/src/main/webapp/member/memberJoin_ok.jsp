<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("UTF-8");   
 %>
    
<jsp:useBean id="mdto" class="com.ezenstyle.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.ezenstyle.member.MemberDAO"></jsp:useBean>

<%
int count = mdao.memberInsert(mdto);
String msg = count > 0? "가입축 ㅋ":"가입실패!";
%>

<script>
window.alert('<%=msg %>');
location.href='/ezenstyle/main.jsp';
</script>   