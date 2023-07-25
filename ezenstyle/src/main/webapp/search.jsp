<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ezenstyle.goods.GoodsDTO" %>
<jsp:useBean id="gdao" class="com.ezenstyle.goods.GoodsDAO"></jsp:useBean>
<%
String userInput=request.getParameter("userInput");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/semiLayout.css">
<style>
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
h3{
	margin-left:20px;
}
.blind {
  position: absolute;
  width: 1px;
  height: 1px;
  clip: rect(0 0 0 0);
  overflow: hidden;
}
#searchIcon{
	width:20px;
	height:20px;
}
</style>
</head>
<body>
<%@include file="header.jsp" %>
<section>
	<article>
		<h3><img src="/ezenstyle/img/search.png" alt="검색아이콘" id="searchIcon">&nbsp;&nbsp;<%=userInput %></h3>
		<table>
		<caption class="blind">검색된 상품</caption>
			<tr>
			    <%
				ArrayList<GoodsDTO> arr=gdao.searchItem(userInput);
				if(arr==null||arr.size()==0){
					%>
					<td colspan="4">검색 결과가 없습니다.</td>
					<%
				}else{
					for(int i=0;i<arr.size();i++){
						if(i%4==0){
							%>
							</tr>
							<tr>
							<% 	
						}
						%>
						<td>
							<img src="<%=arr.get(i).getG_img()%>" alt="상품이미지"><br>
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
</section>
<%@include file="footer.jsp" %>
</body>
</html>