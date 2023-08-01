<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
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
#box1{flex:1;padding-top: 15px;background-color: blue;}
#box2{flex:2;padding-top: 32px;background-color: orange;}
#box3{flex:1;padding-top: 15px;background-color: skyblue;}
li{list-style-type:none;}
#memberbye{color: red;}
#tablelist{margin:0px auto; width:500px;}
.b {
height: 200px;
width: 200px;
object-fit:contain;
}
.btn1{
margin-left:15px;
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
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<div id="container">
<div id="box1">
<ul id="ul1">
	<li><a href="/ezenstyle/member/memberMypage.jsp">내 정보 보기 및 수정</a><br></li>
	<li><a href="/ezenstyle/member/memberCart.jsp">장바구니</a></li>
	<li><h4>구매 내역</h4></li>
	<li><span><br><br><br><br><a href="memberDel.jsp" id="memberbye">[회원탈퇴]</a></span></li>
</ul>
</div>
<div id="box2">
<%
	String detailorderdate = request.getParameter("detailorderdate");
	String userid=(String)session.getAttribute("sid");
	ArrayList<OrderDTO> arr=new ArrayList<OrderDTO>();
	arr=odao.orderDetailList(userid,detailorderdate);
%>
<table id="tablelist" border="1">
<%
	if(arr==null||arr.size()==0) {
		%>
			<tr><td>구매한 상품이 없습니다.</td></tr>
		<%
	}else{
		for(int i=0; i < arr.size(); i++){
			%><tr><td rowspan="4"><img src="/ezenstyle/goods/imgs/<%=arr.get(i).getG_nfile() %>" class="b"></td><td><a id ="subject1" >상품 이름 : <%= arr.get(i).getG_name() %></a></tr>
			<tr><td>수량 : <%=arr.get(i).getOrdernum() %>개 / <%=arr.get(i).getG_price() * arr.get(i).getOrdernum() %>원</td></tr>
			<tr><td>사이즈 : <%= arr.get(i).getG_size()%></td></tr>
			<tr><td>배송 상태 : <%= arr.get(i).getO_state()%></td></tr>
			<%
		}
	}
		%>

</table>
</div>
<div id="box3">
<button class="btn1" onclick="location.href='memberorderDetailList_ok.jsp?detailorderdate=<%=detailorderdate%>'">주문 취소</button>
</div>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>