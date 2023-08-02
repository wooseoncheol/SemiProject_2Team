<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.ezenstyle.order.*" %>
<jsp:useBean id="odao" class="com.ezenstyle.order.OrderDAO"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/semiLayout.css">
<style type="text/css">
#container {display: flex;padding-top: 30px;}
#box1{flex:1;padding-top: 15px;}
#box2{flex:1.9;padding-top: 7px;}
#box3{flex:0.6;padding-top: 15px;}
#ul1{margin-left:70px;padding-top:5px;}
li{list-style-type:none;}
#memberbye{color: red;}
table {
margin-right: auto;
margin-left: auto;
margin-top: 10px;
margin-bottom: 100px;
width: 500px;
border-collapse: collapse;
}
#box21{text-align: center;}
#tsablelist{margin:0px auto; width:500px;}
.b {
height: 200px;
width: 200px;
object-fit:contain;
}
.gh{
border-top: 3px solid #F0F0F0;
}
.g {
height: 37px;
}
.gf{
height: 43px;
border-bottom: 3px solid #F0F0F0;
}
.btn1{
margin-top:30px;
margin-left:55px;
width:100px;
height:40px;
background-color: white;
border-style: solid;
border-top-color:#E7E7E7;
border-left-color:#E7E7E7;
border-bottom-color: #E7E7E7;
border-right-color: #E7E7E7;
border-radius: 5px;
}
#subject1{
font-weight: bold;
font-size: 17px;
}
#span11{
margin-top: 30px;
text-align: center;
}
#text11{
font-size: 13px;
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<div id="container">
<div id="box1">
<ul id="ul1">
	<li><a href="/ezenstyle/member/memberMypage.jsp">내 정보 보기 및 수정</a><br><br></li>
	<li><a href="/ezenstyle/member/memberCart.jsp">장바구니</a><br><br></li>
	<li><a href="/ezenstyle/member/memberOrderHistory.jsp" >구매 내역</a></li>
	<li><h4>&nbsp;&nbsp;&nbsp;L&nbsp;구매 상세 페이지</h4></li>
	
</ul>
</div>
<div id="box2">
<%
	DecimalFormat df = new DecimalFormat("###,###,###");
	String detailorderdate = request.getParameter("detailorderdate");
	String userid=(String)session.getAttribute("sid");
	ArrayList<OrderDTO> arr=new ArrayList<OrderDTO>();
	arr=odao.orderDetailList(userid,detailorderdate);
%>
<div id="box21"><h2>구매 상세 내역</h2></div>
<table id="tablelist">
<%
	if(arr==null||arr.size()==0) {
		%>
			<tr><td>구매한 상품이 없습니다.</td></tr>
		<%
	}else{
		for(int i=0; i < arr.size(); i++){
			%><tr class="gh"><td rowspan="5"><img src="/ezenstyle/goods/imgs/<%=arr.get(i).getG_nfile() %>" class="b"></td>
			<td><a id ="subject1" >상품 이름 : <%= arr.get(i).getG_name() %></a></tr>
			<tr class="g"><td>수량 : <%=arr.get(i).getOrdernum() %>개 / <%=df.format(arr.get(i).getG_price() * arr.get(i).getOrdernum())%>원</td></tr>
			<tr class="g"><td>사이즈 : <%= arr.get(i).getG_size()%></td></tr>
			<tr class="g"><td>구매날짜 : <%=arr.get(i).getOrderdate() %></td></tr>
			<tr class="gf"><td>배송 상태 : <%= arr.get(i).getO_state()%></td></tr>
			<%
		}
	}
		%>

</table>
</div>
<div id="box3">
<button class="btn1" onclick="location.href='memberorderDetailList_ok.jsp?detailorderdate=<%=detailorderdate%>'">주문 취소</button>
<div id="span11"><a id="text11"> * 배송중일때는 결제 취소가 <br>불가능 합니다 *</a></div>
</div>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>