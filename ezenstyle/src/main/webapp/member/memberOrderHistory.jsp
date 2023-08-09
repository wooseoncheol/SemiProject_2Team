<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ezenstyle.order.*" %>
<%@ page import="java.text.*" %>
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
#box2{flex:2;padding-top: 10px;display: flex;}
#box3{flex:0.5;padding-top: 15px;}
#ul1{margin-left:70px;padding-top:5px; }
.tname{text-align: center;}
#box1 ul li{
list-style-type:none;
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
width: 500px;
border-collapse: collapse;
}
.gh {
align-items: center;
height: 70px;
text-align:center;
font-size: 25px;
}
.g {
height: 40px;
text-align:center;
border-bottom: 3px solid #F0F0F0;
border-top: 3px solid #F0F0F0;
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
#memberbye{
color: red;
}
#subject1{
font-weight: bold;
font-size: 17px;
}
</style>

</head>
<body>
<%@include file="../header.jsp" %>

<div id="container">
<div id="box1">
<ul id="ul1">
	<li><a href="/ezenstyle/member/memberMypage.jsp">내 정보 보기 및 수정</a><br><br></li>
	<li><a href="/ezenstyle/member/memberCart.jsp">장바구니</a></li>
	<li><h4>구매 내역</h4></li>
	
</ul>
</div>
<div id="box2">
<%
	DecimalFormat df = new DecimalFormat("###,###,###");
	String userid=(String)session.getAttribute("sid");
	ArrayList<OrderDTO> arr=new ArrayList<OrderDTO>();
	arr=odao.orderList(userid);
%>

<table id="tablelist">
<tr class="gh"><th colspan="2">구매 내역</th></tr>
<%
	if(arr==null||arr.size()==0) {
		%>
			<tr class="g"><td>구매한 상품이 없습니다.</td></tr>
		<%
	}else{
		for(int i=0; i < arr.size(); i++){
			if(arr.get(i).getRn() == 1){
			%>
				<tr class="g" onclick="location.href='memberorderDetailList.jsp?detailorderdate=<%=arr.get(i).getDetailorderdate()%>&detailstate=<%=arr.get(i).getDel_state()%>'">
				<td rowspan="5"><img src="/ezenstyle/goods/imgs/<%=arr.get(i).getG_nfile() %>" class="b"></td>
				<td><a id ="subject1" ><%= arr.get(i).getG_name() %></a>
				<% if(arr.get(i).getMax() >= 2){
					%>
					외 <%= arr.get(i).getMax() -1 %> 건 </td>
					<%
				}
				%>
				<tr class="g"><td>주문번호 : <%= arr.get(i).getO_idx() %> / 수량 : <%=arr.get(i).getOrdernum() %>개 / <%=df.format(arr.get(i).getG_price() * arr.get(i).getOrdernum() )%>원</td></tr>
				<tr class="g"><td>구매날짜 : <%=arr.get(i).getOrderdate1() %></td></tr>
				<tr class="g"><td>배송지 : <%=arr.get(i).getAdr() %></td></tr>
				<tr class="g"><td>배송상태 : 
				<% 
				if(arr.get(i).getO_state().equals("결제 취소 요청")||arr.get(i).getO_state().equals("취소 완료")){
					out.println(arr.get(i).getO_state());
				}else{
					switch(arr.get(i).getDel_state()){
					case 0 : out.println(arr.get(i).getO_state());break;
					case 1 : out.println("배송 시작");break;
					case 2 : out.println("배송 중");break;
					default : out.println("배송 완료");break;
					}
				}
				
				%></td></tr>
				<tr><td><br></td></tr>
				
			<%
			
			}
			
		}
		
	}
%>
</table>
</div>
<div id="box3">

</div>

</div>
<%@include file="../footer.jsp" %>
</body>
</html>