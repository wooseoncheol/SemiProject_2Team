<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.notice.*" %>
<jsp:useBean id="ndao" class="com.ezenstyle.notice.NoticeDAO"></jsp:useBean>

<% 
String idx_s=request.getParameter("idx");
if (idx_s.equals("")||idx_s==null){
	idx_s="0";
}
int idx=Integer.parseInt(idx_s);
int result=ndao.noticeDelete(idx);
String msg=result>0?"삭제 성공":"삭제 실패";
%>
<script>
	window.alert('<%=msg%>');
	location.href='noticeList.jsp';
</script>
