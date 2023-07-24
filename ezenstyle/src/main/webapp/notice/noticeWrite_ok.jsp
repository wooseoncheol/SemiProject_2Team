<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ndto" class="com.ezenstyle.notice.NoticeDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ndto"/>
<jsp:useBean id="ndao" class="com.ezenstyle.notice.NoticeDAO"></jsp:useBean>
<%
int result=0;
String announce=request.getParameter("announce");
System.out.println(announce);
if (announce==null) {
	result=ndao.noticeWrite(ndto);
} else {
	result=ndao.announceWrite(ndto);
}
String msg=result>0?"글쓰기 성공":"글쓰기 실패";
%>
<script>
	window.alert('<%=msg %>');
	location.href='noticeList.jsp';
</script>