<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.ezenstyle.goods.GoodsDTO" %>
<jsp:useBean id="gdao" class="com.ezenstyle.goods.GoodsDAO"></jsp:useBean>
<%
String userInput=request.getParameter("userInput");
%>
<%	
	DecimalFormat df = new DecimalFormat("###,###,###");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/semiLayout.css">
<style>
h4{
	margin-left:65px;
	margin-top: 5px;
	margin-bottom:3px;
}

#goodsIcon{
	margin-top:30px;
	margin-left:60px;
	width:220px;
	height:320px;
	object-fit: cover;
}
#ca{
	margin-left:65px;
	color: gray;
	font-size:12px;
}
p{
	margin-left:65px;
	margin-top: -2px;
}
h3{
	margin-left:30px;
}
.blind {
  position: absolute;
  width: 1px;
  height: 1px;
  clip: rect(0 0 0 0);
  overflow: hidden;
}
label{
	border-bottom: 1px solid black;
}
#searchtxt{
	border-top: none;
	border-right: none;
	border-left: none;
	outline:none;
	font-size: 17px;
}
table{
	clear: both;
	margin: 0px auto;

}
#goodsimg{
	margin-top: 30px;
}
</style>
</head>
<body>
<%@include file="header.jsp" %>
<section>
	<article>	
		<br>
		<h3>
		&nbsp;&nbsp;
		SEARCH :&nbsp;<input type="text" value="<%=userInput %>" readonly id="searchtxt">
		</h3>
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
							<a href = "/ezenstyle/goods/goodsContent.jsp?idx=<%=arr.get(i).getIdx()%>"><img src="/ezenstyle/goods/imgs/<%=arr.get(i).getG_nfile()%>" alt="상품이미지" id="goodsIcon"><br>
							<a id="ca"><b><%=arr.get(i).getG_category() %></b></a>
							<h4><%=arr.get(i).getG_name()%></h4>
							<p><%=df.format(arr.get(i).getG_price()) %>원</p></a>
						</td>
						<% 
					}
				}
				%>
			</tr>
		</table>
		<br>
		<br>
		<br>
		<br>
	</article>
</section>
<%@include file="footer.jsp" %>
</body>
</html>