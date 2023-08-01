<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.goods.*" %>
<%@ page import="com.ezenstyle.order.*" %>
<%@ page import="com.ezenstyle.cart.*" %>
<jsp:useBean id="idao" class="com.ezenstyle.goods.GoodsDAO"></jsp:useBean> 
<jsp:useBean id="cdao" class="com.ezenstyle.cart.CartDAO"></jsp:useBean> 
<jsp:useBean id="odao" class="com.ezenstyle.order.OrderDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");

String sid=(String)session.getAttribute("sid");
String idx_s = request.getParameter("idx");
int idx = Integer.parseInt(idx_s);
String ordernum1=request.getParameter("g_stock");
GoodsDTO dto1 = idao.showGoodscontent(idx);
String name=request.getParameter("name");
String addr=request.getParameter("addr");
String tel=request.getParameter("tel");

String msg="";

String g_nfile=dto1.getG_nfile();
String g_name=dto1.getG_name();
int g_price=dto1.getG_price();
String g_size=dto1.getG_size();
int ordernum=Integer.parseInt(ordernum1);
String g_category=dto1.getG_category();
String o_state="결제 완료";

OrderDTO dto=new OrderDTO(sid,name,addr,tel,g_nfile,g_name,g_price,g_size,ordernum,g_category,o_state);

int result=odao.insertOrder(dto);

if(result>0){
	msg=result>0?"결제가 완료되었습니다":"결제가 실패하였습니다";
	cdao.updateStock(ordernum, idx);
}else{
	msg="결제가 등록 실패. 고객센터 문의바랍니다!";
}
%>
<script>
	window.alert('<%=msg%>');
	location.href=document.referrer;
	location.href='/ezenstyle/member/memberMypage.jsp';
</script>