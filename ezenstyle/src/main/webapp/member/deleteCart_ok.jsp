<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="odao" class="com.ezenstyle.order.OrderDAO"></jsp:useBean>
<%
String c_idx_s=request.getParameter("c_idx");
if(c_idx_s==null || c_idx_s.equals("")){
	%>
	<script>
		window.alert('이미 삭제된 상품이거나 잘못된 접근입니다.');
		history.go(-1);
	</script>
	<%
}
int c_idx=Integer.parseInt(c_idx_s);
String g_idx_s=request.getParameter("g_idx");
int g_idx=Integer.parseInt(g_idx_s);

int result=odao.deleteCart(c_idx);

%>
<script>
location.href='memberCart.jsp'
</script>