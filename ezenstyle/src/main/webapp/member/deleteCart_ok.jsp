<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="odao" class="com.ezenstyle.order.OrderDAO"></jsp:useBean>
<%
String c_idx_s=request.getParameter("cid");
int c_idx=Integer.parseInt(c_idx_s);
String g_idx_s=request.getParameter("g_idx");
int g_idx=Integer.parseInt(g_idx_s);

int result=odao.deleteCart(c_idx);

String msg=result>0?"장바구니에서 상품이 삭제되었습니다.":"장바구니 상품 삭제에 실패했습니다.";
%>
<script>
window.alert('<%=msg%>');
location.href = document.referrer;
</script>