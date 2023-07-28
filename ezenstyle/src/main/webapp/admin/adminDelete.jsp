<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gdao" class="com.ezenstyle.goods.GoodsDAO"></jsp:useBean>
<%
String idx_s=request.getParameter("idx");
int idx=Integer.parseInt(idx_s);
int result=gdao.adminDelete(idx);
String msg=result>0?"삭제 성공":"삭제 실패";
%>
<script>
	window.alert('<%=msg %>');
	location.href='adminMain.jsp';
</script>
