<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/ezenstyle/css/semiLayout.css">
<style>
h3 {
text-align: center;
}
table {
margin-right: auto;
margin-left: auto;
margin-top: 100px;
margin-bottom: 100px;
width: 900px;
border-collapse: collapse;
}
table tbody {
height: 70px;
text-align:center;
border-bottom: 3px solid #F0F0F0;
border-top: 3px solid #F0F0F0;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
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

%>	
		<form name="adminUpdate" action="adminUpadate_ok.jsp">
		<h3>상품 수정 페이지</h3>
			<table border="1" width="300" height="400">
				<tbody>
				<tr>
					<td rowspan="6"></td>
					<td>상품번호:<%=idx %> </td>
				</tr>
				<tr>
					<td><input type="text" name="name" value=<%=name %>></td>
				</tr>
				<tr>	
					<td><input type="text" name="price" value=<%=price %>></td>
				</tr>
				<tr>
					<td><input type="text" name="color" value=<%=color %>></td>
				</tr>
				<tr>
					<td><input type="text" name="size" value=<%=size %>></td>
				</tr>
				<tr>
					<td><input type="text" name="stock" value=<%=stock %>></td>
				</tr>
				<tr>
					<td><input type="text" name="detail" value=<%=detail %>></td>
				</tr>
				</tbody>
			</table>
		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>