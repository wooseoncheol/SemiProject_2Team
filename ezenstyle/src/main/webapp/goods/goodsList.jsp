<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.goods.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="idao" class="com.ezenstyle.goods.GoodsDAO" scope="session"></jsp:useBean>
<%String category_s = request.getParameter("category"); %>
<%String category = category_s.toUpperCase(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%	
	
	
	int totalCnt = idao.getTotalCnt(category_s);
	int listSize=6;
	int pageSize=5;
	
	String cp_s = request.getParameter("cp");
	if(cp_s==null || cp_s.equals("")){
		cp_s="1";
	}
	int cp = Integer.parseInt(cp_s);

	int totalpage=totalCnt/listSize+1;
	if(totalCnt % listSize == 0){totalpage--;}
	
	int userGroup = cp/pageSize;  
	if(cp%pageSize==0){
		userGroup--;
	}
%>
<style>
img{
width: 150px;
height: 250px;
}
section h3{
font-style: italic;
}
section li{
list-style-type:none;
width: 150px;
margin: center;
}
section table{
margin: 0px auto;
height: 200px;
}
section td{
padding-right: 100px;
font-size: 15px;
}
#img {
background-color: skyblue;
width: 150px;
height: 250px;
}
section fieldset{
margin: 0px, auto;
}
</style>
<link rel="stylesheet" type="text/css" href="../css/semiLayout.css">
</head>
<body>
<%@include file = "../header.jsp" %>
<section>
<h3><%=category%></h3>
<article>
<table>
	<tr>
	<%
	ArrayList<GoodsDTO> arr = idao.showGoodsList(category_s, cp, listSize);
	for (int i = 0 ; i<arr.size(); i++){
		%>
		<td>
			<ul><a href = "goodsContent.jsp?idx=<%=arr.get(i).getIdx()%>">
			<li id = "img"><img src="/ezenstyle/goods/imgs/<%=arr.get(i).getG_nfile() %>"></li>
			<li><%=arr.get(i).getG_name() %></li>
			<li><%=arr.get(i).getG_price() %>원</li>
			</a></ul>
		</td>
		<%if((i+1)%3==0){
			%>
			</tr>
			<tr>
			<%
		}
	}
	%>
	</tr>
	<tr>
		<td colspan ="3" align = "center">
			<%
		if(userGroup!=0){
			%> <a href="goodsList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize %>&category=<%=category_s%>">&lt;&lt;</a> <%
		}
		%>
		<%
		for(int i = userGroup*pageSize+1 ; i<=userGroup*pageSize+pageSize; i++){
			%>&nbsp;&nbsp;<a href="goodsList.jsp?cp=<%= i%>&category=<%=category_s%>"><%=i%></a>&nbsp;&nbsp;<%
			if(i==totalpage){
				break;
			}
		}
		%>
		<%
		if(userGroup!=(totalpage/pageSize-(totalpage%pageSize==0?1:0))){
			%> <a href="goodsList.jsp?cp=<%=(userGroup+1)*pageSize+1 %>&category=<%=category_s%>">&gt;&gt;</a> <%
		}
		%>
		</td>
	</tr>
</table>
</article>
</section>
<%@include file = "../footer.jsp" %>
</body>
</html>