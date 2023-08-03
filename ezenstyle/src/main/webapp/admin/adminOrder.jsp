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
table {
margin-right: auto;
margin-left: auto;
margin-top: 100px;
margin-bottom: 100px;
width: 650px;
border-collapse: collapse;
}
.q{
text-align: center;
}
.g {
height: 40px;
text-align:center;
border-bottom: 3px solid #F0F0F0;
border-top: 3px solid #F0F0F0;
}
.u {
height: 45px;
border-bottom: 3px solid #F0F0F0;
border-top: 3px solid #F0F0F0;
text-indent: 30px;
}
#aa a:link {
	color:blue;
}
#aa a:visited {
	color:blue;
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

			%>
			
			<table id="aa"><%
			for(int i=0;i<arr.size();i++) {
			if (arr.get(i).getRn()==1) {						
				%>
				<tr class="u">
				<td>주문번호: <%=arr.get(i).getO_idx() %></td>
				<td>고객 이름: <%=arr.get(i).getName() %></td>
				</tr>
				<tr class="u">
				<td>구매 날짜: <%=arr.get(i).getOrderdate() %></td>
				<td>상품 이름: <%=arr.get(i).getG_name() %>
				<%int max=arr.get(i).getMax()-1; 
				
				if (max==0){
					out.println("");
				} else {
					out.println("외 "+max+"건");
				}
				%>
				</tr>
				<tr class="u">
				<td>배송지: <%=arr.get(i).getAdr() %> 
				<td>배송현황: 
				
				<%
				if (arr.get(i).getO_state().equals("취소 완료")) {
					%>
					<%=arr.get(i).getO_state() %>
					</td>
					</tr>
					<tr class="g">
					<td>구매 취소 완료</td>
					</tr>
					<%
				} else {
				
				switch (arr.get(i).getDel_state()) {
				case 0:out.println(arr.get(i).getO_state());
					if (arr.get(i).getO_state().equals("결제 취소 요청")) {
						%>
						</td>
						</tr>
						<tr class="g">
						<td><a href="adminOrder_ok.jsp?orderdate1=<%=arr.get(i).getOrderdate1() %>">결제 취소 요청</a></td>
						</tr>
						<%
					} else {
						%>
						</td>
						</tr>
						<tr class="g">
						<td>취소 가능</td>
						</tr>
						<%
					}
				;break;
				case 1:out.println("배송 시작");
					%>
					<tr class="g">
					<td>취소 불가</td>
					</tr>
					<%
					break;	
				case 2:out.println("배송 중");
					%>
					<tr class="g">
					<td>취소 불가</td>
					</tr>
					<%
					break;
				case 3:out.println("배송 완료");
					%>
					<tr class="g">
					<td>취소 불가</td>
					</tr>
					<%
				}
				%>
				
				</td>
				<tr>
				<td><br></td>
				</tr>
		<%
				} 
			}
		}
			%></table>
				
			<%

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