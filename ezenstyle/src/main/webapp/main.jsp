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
<link rel="stylesheet" type="text/css" href="css/semiLayout.css">
<style>
h2{
	text-align:center;
}
h4{
	margin-left: 30px;
	margin-top: 5px;
	margin-bottom:3px;
}
img{
	margin-left:30px;
	width:200px;
	height:300px;
}
#ca{
	margin-left:30px;
	color: gray;
	font-size:12px;
}
p{
	margin-left: 30px;
	margin-top: -2px;
}
.blind {
  position: absolute;
  width: 1px;
  height: 1px;
  clip: rect(0 0 0 0);
  overflow: hidden;
}
</style>
</head>
<body>
<%@include file="header.jsp" %>
<section>
	<article>
	<br>
	<br>
		<h2>BEST ITEM</h2>
		<table>
		<caption class="blind">인기 상품 목록</caption>
			<tr>
		<%
		ArrayList<GoodsDTO> arr=gdao.bestItemList();
		
		if(arr==null || arr.size()==0){
			%>
			<td colspan="5" align="center">
			등록된 상품이 없습니다.
			</td>
			<%
		}else{
			for(int i=0;i<arr.size();i++){
				%>
				<td>
				<img src="<%=arr.get(i).getG_nfile()%>" alt="상품이미지"><br>
				<a id="ca"><b><%=arr.get(i).getG_category() %></b></a>
				<h4><%=arr.get(i).getG_name()%></h4>
				<p><%=arr.get(i).getG_price() %>원</p>
				</td>
				<%
			}
		}
		
		
		%>
			</tr>
		</table>
		
	</article>
	<!-- ---------------------------------------- -->
	<br>
	<br>
	<br>
	<article>
		<h2>NEW ARRIVAL</h2>
		<table>
		<caption class="blind">신상품 목록</caption>
			<tr>
		<%
		ArrayList<GoodsDTO> arr2=gdao.newItemList();
		
		if(arr2==null || arr2.size()==0){
			%>
			<td colspan="5" align="center">
			등록된 상품이 없습니다.
			</td>
			<%
		}else{
			for(int i=0;i<arr.size();i++){
				%>
				<td>
				<img src="<%=arr2.get(i).getG_nfile()%>" alt="상품이미지"><br>
				<a id="ca"><b><%=arr2.get(i).getG_category() %></b></a>
				<h4><%=arr2.get(i).getG_name()%></h4>
				<p><%=arr2.get(i).getG_price() %>원</p>
				</td>
				<%
			}
		}
		
		%>
			</tr>
		</table>
	</article>
	<br>
	<br>
	<br>
</section>
<%@include file="footer.jsp" %>
</body>
</html>