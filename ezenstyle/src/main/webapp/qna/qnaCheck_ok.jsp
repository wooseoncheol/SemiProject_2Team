<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");   
String idx=request.getParameter("idx");
String pwd=request.getParameter("pwd");
String pwd2=request.getParameter("pwd2");
System.out.println(idx);

if (pwd.equals(pwd2)){
	%>
	<script>
	 opener.location.href="qnaContent.jsp?idx=<%=idx%>";
	 window.self.close();
	</script>
	<%
} else {
	%>
	<script>
	opener.location.href="qnaList.jsp";
	window.self.close();
	</script>
	<%
}

%>