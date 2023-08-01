<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.ezenstyle.order.*" %>
<jsp:useBean id="odao" class="com.ezenstyle.order.OrderDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
<%@include file="/header.jsp" %>
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

<div id="box2">
	<%
	ArrayList<OrderDTO> arr=new ArrayList<OrderDTO>();
	arr=odao.adminOrder();
	%>
	<%if (arr==null||arr.size()==0) {	
		%>
		<table>
		<thead>
			<tr class="q">
				<td>결제된 상품이 없습니다.</td>
			</tr>
		</thead>
		</table>
		<% 
		} else {
			%><table><%
			for(int i=0;i<arr.size();i++) {
		%>
				<tr>
				<td>고객 이름: <%=arr.get(i).getName() %></td>
				</tr>
				<tr>
				<td>구매 날짜: <%=arr.get(i).getOrderdate() %></td>
				</tr>
				<tr>
				<td>상품 이름: <%=arr.get(i).getG_name() %>
				</tr>
				<tr>
				<td>배송지: <%=arr.get(i).getAdr() %> 배송현황: 
				
				<%switch (arr.get(i).getDel_state()) {
				case 0:out.println("배송 시작");break;
				case 1:out.println("배송 중");break;
				case 2:out.println("배송 중");break;
				case 3:out.println("배송 완료");
				}
				%>
				
				</td>
				</tr>
				<tr>
				<td>RN : <%=arr.get(i).getRn() %>
				</tr>
				<tr>
				<td>MAX : <%=arr.get(i).getMax() %></td>
				</tr>
				<tr>
				<td><hr></td>
				</tr>
				<tr>
				<td><br></td>
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

<%@include file="/footer.jsp" %>
</body>
</html>