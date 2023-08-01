<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="odao" class="com.ezenstyle.order.OrderDAO"></jsp:useBean>
<% 
String detailorderdate = request.getParameter("detailorderdate");
String userid=(String)session.getAttribute("sid");
int result=odao.orderDetailListCancel(userid,detailorderdate);
String msg="";
if(result > 0){
	msg="주문 취소 요청";
}else{
	msg ="주문 취소 요청 실패";
}

%>
<script>
window.alert('<%= msg %>');
location.href='memberOrderHistory.jsp';
</script>

















