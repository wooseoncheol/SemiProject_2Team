<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="adto" class="com.ezenstyle.goods.GoodsDTO"></jsp:useBean>
<jsp:setProperty property="*" name="adto"/>
<jsp:useBean id="adao" class="com.ezenstyle.goods.GoodsDAO"></jsp:useBean>
<%
String idx_s=request.getParameter("idx");
int idx=Integer.parseInt(idx_s);
String name=request.getParameter("name");
String color=request.getParameter("color");
String size=request.getParameter("size");
String stock_s=request.getParameter("stock");
int stock=Integer.parseInt(stock_s);
String price_s=request.getParameter("price");
int price=Integer.parseInt(price_s);
String detail=request.getParameter("detail");
String category=request.getParameter("g_category");

int result=adao.adminUpdate(category, idx, name, color, size, stock, price, detail);
String msg=result>0?"수정이 완료되었습니다.":"수정에 실패했습니다.";

int result2=adao.existCartGoods(idx);
if(result2>0){
   adao.cartUpdate(idx, name, size, price);   
}
%>
<script>
window.alert('<%=msg %>');
location.href='adminMain.jsp';
</script>



