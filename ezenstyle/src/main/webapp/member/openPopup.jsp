<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.cart.*" %>    
<jsp:useBean id="cdao" class="com.ezenstyle.cart.CartDAO"></jsp:useBean>
<%
String c_idx_s=request.getParameter("c_idx");
if(c_idx_s==null || c_idx_s.equals("")){
	%>
	<script>
		window.alert('삭제된 상품이거나 잘못된 접근입니다.');
		window.self.close();
	</script>
	<%
}
int c_idx=Integer.parseInt(c_idx_s);
CartDTO dto=cdao.showCartOne(c_idx);
int g_stock=cdao.getStock(dto.getG_idx());

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
	<article>
		<form name="openPopup" action="openPopup_ok.jsp">
		<table>
			<tr>
				<th>상품이름</th>
				<td><%=dto.getG_name()%></td>
			</tr>
			<tr>
				<th>상품 카테고리</th>
				<td><%=dto.getG_category()%></td>
			</tr>
			<tr>
				<th>수량</th>
				<td>
				<select name="ordernum">
				<%
				
					for(int i=1;i<=g_stock;i++){
						if(i==dto.getOrdernum()){
							%><option value=<%=i%> selected><%=i %></option><% 
						}else{
							
							%><option value=<%=i%>><%=i %></option><% 
						}
					}
				%>
				</select>
				</td>
				<input type="hidden" name="c_idx" value="<%=dto.getC_idx()%>">
			</tr>
		</table>
		<div><input type="submit" value="수정하기"><input type="button" value="수정 취소" onclick="window.close()"></div>
		</form>	
	</article>
</section>
</body>
</html>