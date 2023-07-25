<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qdto" class="com.ezenstyle.qna.QnaDTO"></jsp:useBean>
<jsp:setProperty property="*" name="qdto"/>
<jsp:useBean id="qdao" class="com.ezenstyle.qna.QnaDAO"></jsp:useBean>
<%
int result=qdao.qnaReWrite(qdto);
String msg=result>0?"답변 작성 완료":"답변 작성 실패";
%>
<script>
window.alert('<%=msg%>');
location.href='qnaList.jsp';
</script>