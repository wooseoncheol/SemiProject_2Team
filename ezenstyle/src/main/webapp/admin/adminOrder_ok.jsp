<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="odao" class="com.ezenstyle.order.OrderDAO"></jsp:useBean>

<%
String orderdate1=request.getParameter("orderdate1");
System.out.println(orderdate1);
int result=odao.adminCancel(orderdate1);
String msg=result>0?"결제 취소 완료":"실패하였습니다.";
%>

<script>
window.alert('<%=msg %>');
location.href='adminOrder.jsp';
</script>