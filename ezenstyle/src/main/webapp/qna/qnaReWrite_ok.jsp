<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qdto" class="com.ezenstyle.qna.QnaDTO"></jsp:useBean>
<jsp:setProperty property="*" name="qdto"/>
<jsp:useBean id="qdao" class="com.ezenstyle.qna.QnaDAO"></jsp:useBean>
<%
int result=qdao.qnaReWrite(qdto);
String msg=result>0?"답변 작성 완료":"답변 작성 실패";
String id = qdto.getId();
String id2 = request.getParameter("id2");

System.out.println(id);
System.out.println(id2);

int count=qdao.qnaChange(id2, id);
if (count>0) {
	System.out.println("성공");
}
%>
<script>
window.alert('<%=msg%>');
location.href='qnaList.jsp';
</script>