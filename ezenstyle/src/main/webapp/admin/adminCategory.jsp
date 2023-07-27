<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.goods.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="gdao" class="com.ezenstyle.goods.GoodsDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/ezenstyle/css/semiLayout.css">
<style>
#box1{flex:1;padding-top: 15px;}
#box2{flex:2;padding-top: 32px;display: flex;}
#container {display: flex;padding-top: 30px;}
#box1 ul{
padding-left: 180px;
}
#box1 ul li{
list-style-type:none;
height: 50px;
}
#box2 table{
margin:0px auto;
}
table {
margin-right: auto;
margin-left: auto;
margin-top: 100px;
margin-bottom: 100px;
width: 900px;
border-collapse: collapse;
}
table thead {
height: 40px;
text-align:center;
border-bottom: 3px solid #F0F0F0;
border-top: 3px solid #F0F0F0;
}
table tbody {
border-bottom: 3px solid #F0F0F0;
border-top: 3px solid #F0F0F0;
text-indent: 30px;
}
table tfoot {
height: 40px;
text-align:center;
border-bottom: 3px solid #F0F0F0;
border-top: 3px solid #F0F0F0;
}
img {
height: 200px;
width: 200px;
object-fit:contain;
}
.a {
margin: 0px;
padding: 0px;
width: 200px;
border-collapse: collapse;
}
.b {display:block;}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<div id="container">
		<div id="box1">
			<ul>
				<li><a href="adminCategory.jsp?category=man">MAN</a></li>
				<li><a href="adminCategory.jsp?category=woman">WOMAN</a></li>
				<li><a href="adminCategory.jsp?category=kid">KID</a></li>
				<li><a href="adminCategory.jsp?category=accessories">ACCESSORIES</a></li>
				<li><a href="adminCategory.jsp?category=shoes">SHOES</a></li>
			</ul>
		</div>
	
	<%
	String category=request.getParameter("category");
	String category_t=category.toUpperCase();
	
	ArrayList<GoodsDTO> arr=new ArrayList<GoodsDTO>();
	arr=gdao.adminCategory(category);
	%>
	<div id="box2">
	<table border="1">
	<%if (arr==null||arr.size()==0) {	
		%>
		<thead>
			<tr>
				<td>등록된 상품이 없습니다.</td>
			</tr>
		</thead>
		<% 
		} else {
			for(int i=0;i<arr.size();i++) {
		%>
			<thead>
				<tr>
					<th colspan="2"><%=arr.get(i).getG_name() %></th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="3"><a href="adminUpdate.jsp?idx=<%=arr.get(i).getIdx() %>
					&name=<%=arr.get(i).getG_name() %>&color=<%=arr.get(i).getG_color() %>
					&size=<%=arr.get(i).getG_size() %>&stock=<%=arr.get(i).getG_stock() %>
					&price=<%=arr.get(i).getG_price() %>&detail=<%=arr.get(i).getG_detail() %>">수정</a></td>
				</tr>
			</tfoot>
			<tbody>
				<tr>
					<td rowspan="4" class="a"><img src="/ezenstyle/goods/imgs/<%=arr.get(i).getG_nfile() %>" class="b"></td>
					<td><%=arr.get(i).getG_category() %></td>
				</tr>
				<tr>
					<td>상품번호: <%=arr.get(i).getIdx() %></td>
				</tr>
				<tr>
					<td>색상: <%=arr.get(i).getG_color() %>&nbsp;&nbsp;사이즈: <%=arr.get(i).getG_size() %></td>
				</tr>
				<tr>
					<td>가격: <%=arr.get(i).getG_price() %>&nbsp;&nbsp;재고: <%=arr.get(i).getG_stock() %></td>
				</tr>
			</tbody>
		<%
			}
		}
		%>
	
	</table>
	</div>
	</div>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>