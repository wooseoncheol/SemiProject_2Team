<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.goods.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<jsp:useBean id="gdao" class="com.ezenstyle.goods.GoodsDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%	
	DecimalFormat df = new DecimalFormat("###,###,###");
%>
<link rel="stylesheet" type="text/css" href="/ezenstyle/css/semiLayout.css">
<style>
#container {display: flex;padding-top: 30px;}
#box1{flex:1;padding-top: 15px;}
#box2{flex:3;padding-top: 32px;display: flex;}
#box3{flex:1;padding-top: 15px;}

#box1 ul{
padding-left: 100px;
}
#box1 ul li{
list-style-type:none;
height: 50px;
}
#box2 table{
margin:0px auto;
}
.g_pic{
width:200px;
height: 200px;
}
table {
margin-right: auto;
margin-left: auto;
margin-top: 100px;
margin-bottom: 100px;
width: 650px;
border-collapse: collapse;
}
.g {
height: 40px;
text-align:center;
border-bottom: 3px solid #F0F0F0;
border-top: 3px solid #F0F0F0;
}
.u {
border-bottom: 3px solid #F0F0F0;
border-top: 3px solid #F0F0F0;
text-indent: 30px;
}
.h {
height: 40px;
text-align:center;
border-bottom: 3px solid #F0F0F0;
border-top: 3px solid #F0F0F0;
}
.b {
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
.q{
text-align: center;
}
</style>
<script>
function adminDelete(aaa) {
	var result=window.confirm('삭제하시겠습니까?');
	if (result) {
		location.href='adminDelete.jsp?idx='+aaa;
	} else {
		location.reload();
	}
}
</script>
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
				<li><br><br><a href="adminGoodsSoldout.jsp">품절 상품 보기</a></li>
				<li><br><br><a href="adminOrder.jsp">고객 배송 관리</a></li>
			</ul>
		</div>
	
	<%
	String category=request.getParameter("category");
	String category_t=category.toUpperCase();
	
	ArrayList<GoodsDTO> arr=new ArrayList<GoodsDTO>();
	arr=gdao.adminCategory(category);
	%>
	<div id="box2">
	<%if (arr==null||arr.size()==0) {	
		%>
		<table>
		<thead>
			<tr class="q">
				<td>등록된 상품이 없습니다.</td>
			</tr>
		</thead>
		</table>
		<% 
		} else {
			%><table><%
			for(int i=0;i<arr.size();i++) {
		%>
				<tr class="g">
					<th colspan="2"><%=arr.get(i).getG_name() %></th>
				</tr>
				<tr class="u">
					<td rowspan="4" class="a"><img src="/ezenstyle/goods/imgs/<%=arr.get(i).getG_nfile() %>" class="b"></td>
					<td><%=category_t %></td>
				</tr>
				<tr class="u">
					<td>상품번호: <%=arr.get(i).getIdx() %></td>
				</tr>
				<tr class="u">
					<td>색상: <%=arr.get(i).getG_color() %>&nbsp;&nbsp;사이즈: <%=arr.get(i).getG_size() %></td>
				</tr>
				<tr class="u">
					<td>가격:<%=df.format(arr.get(i).getG_price() ) %>원&nbsp;&nbsp;재고: <%=arr.get(i).getG_stock() %></td>
				</tr>
				<tr class="h">
					<td colspan="3"><a href="adminUpdate.jsp?idx=<%=arr.get(i).getIdx() %>
					&name=<%=arr.get(i).getG_name() %>&color=<%=arr.get(i).getG_color() %>
					&size=<%=arr.get(i).getG_size() %>&stock=<%=arr.get(i).getG_stock() %>
					&price=<%=arr.get(i).getG_price() %>&detail=<%=arr.get(i).getG_detail()%>
					&nfile=<%=arr.get(i).getG_nfile() %>&category=<%=arr.get(i).getG_category() %>">수정</a>&nbsp;&nbsp;&nbsp;
					<a onclick="adminDelete('<%=arr.get(i).getIdx() %>')" style="cursor:pointer;">삭제</a></td>
				</tr>
		<%
			}
			%></table><%
		}
		%>
	</div>
	
	<div id="box3">
	<h4><a href="adminGsubmit.jsp">상품 등록</a></h4>
	</div>
	
	</div>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>