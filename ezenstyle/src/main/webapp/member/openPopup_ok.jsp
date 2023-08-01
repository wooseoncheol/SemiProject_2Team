<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.ezenstyle.cart.*" %>   
<jsp:useBean id="cdao" class="com.ezenstyle.cart.CartDAO"></jsp:useBean>
<%
String ordernum_s=request.getParameter("ordernum");
int ordernum=Integer.parseInt(ordernum_s);
String c_idx_s=request.getParameter("c_idx");
int c_idx=Integer.parseInt(c_idx_s);

int result=cdao.updateOrdernum(ordernum, c_idx);
%>
<script>
window.alert('주문 수량이 변경되었습니다.');
opener.location.reload();
window.close();
</script>
