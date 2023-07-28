<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gdto" class="com.ezenstyle.goods.GoodsDTO"></jsp:useBean>
<jsp:setProperty property="*" name="gdto"/>
<jsp:useBean id="gdao" class="com.ezenstyle.goods.GoodsDAO"></jsp:useBean>

<%
String id=(String)session.getAttribute("sid");
String idx_s = request.getParameter("idx");
String g_stock_s = request.getParameter("g_stock");
int idx= Integer.parseInt(idx_s);
int g_stock= Integer.parseInt(g_stock_s);

if(id==null||id==""){
	%>
	<script>
	window.alert('로그인이 필요한 서비스입니다.');
	history.back();
	</script>
	<% 
	}else{
		int result=gdao.insertCart(gdto, g_stock, idx, id);
			if (result>0) {
				%>
				<script>
				window.alert('장바구니에 담겼습니다.');
				history.back();;
				</script>
				<%
			}else{
				%>
				<script>
				window.alert('장바구니에 담지못했습니다.');
				history.back();
				</script>
				<%
			}
}
%>