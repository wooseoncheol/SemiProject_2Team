<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gdto" class="com.ezenstyle.goods.GoodsDTO"></jsp:useBean>
<jsp:setProperty property="*" name="gdto"/>
<jsp:useBean id="gdao" class="com.ezenstyle.goods.GoodsDAO"></jsp:useBean>

<%

String id=(String)session.getAttribute("sid");
String buttontype = request.getParameter("button");
String idx_s = request.getParameter("idx");
String g_stock_s = request.getParameter("g_stock");
int idx= Integer.parseInt(idx_s);
int g_stock= Integer.parseInt(g_stock_s);
int count= gdao.cartCheck(idx, id);

if(id==null||id==""){
	%>
	<script>
	window.alert('로그인이 필요한 서비스입니다.');
	location.href="/ezenstyle/member/memberLogin.jsp"
	</script>
	<% 
	}else if(gdto.getG_stock()<=0){
		%>
		<script>
		window.alert('품절 상품입니다 1대1 문의를 이용해주세요');
		location.href = document.referrer;
		</script>
		<% 
	}else if(count!=0){
		%>
		<script>
		window.alert('이미 장바구니에 담겨있는 상품입니다.');
		</script>
		<%
		if(buttontype.equals("바로구매")){
			%>
			<script>
			location.href="/ezenstyle/member/memberCart.jsp";
			</script>
			<%
		}
		%>
		<script>
		location.href = document.referrer;
		</script>
		<% 
	}else if(buttontype.equals("바로구매")){
		%>
		<script>
		window.location.href="/ezenstyle/orderInput.jsp?idx=<%=idx%>&g_nfile=<%=request.getParameter("g_nfile")%>&g_category=<%=request.getParameter("g_category")%>&g_name=<%=request.getParameter("g_name")%>&g_price=<%=request.getParameter("g_price")%>&g_color=<%=request.getParameter("g_color")%>&g_size=<%=request.getParameter("g_size")%>&g_stock=<%=g_stock%>&g_detail=<%=request.getParameter("g_detail")%>";
		</script>
		<% 
	}else{
		int result=gdao.insertCart(gdto, g_stock, idx, id);
		String msg = result>0?"장바구니에 담겼습니다.":"장바구니에 담지못했습니다.";
				%>
				<script>
				window.alert('<%=msg%>');
				location.href = document.referrer;
				</script>
				<%
	}
%>