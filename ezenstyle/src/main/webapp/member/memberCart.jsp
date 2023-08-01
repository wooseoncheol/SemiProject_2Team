<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.member.*"%>
<%@ page import="com.ezenstyle.cart.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<jsp:useBean id="cdao" class="com.ezenstyle.cart.CartDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String sid=(String)session.getAttribute("sid");

DecimalFormat df = new DecimalFormat("###,###,###,###");

int total=0;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/semiLayout.css">
<style>
section img{
	width: 150px;
	height: 200px;
	margin-right: -60px;
}
.blind {
  position: absolute;
  width: 1px;
  height: 1px;
  clip: rect(0 0 0 0);
  overflow: hidden;
}
table{
	width:800px;
	height:130px;
	margin:0px auto;
}
section table td{
	font-size:18px;
}
section h3{
	margin-left:15px;
}
.btn1{
width:30px;
height:30px;
background-color:white;
border-style: none;
border-top-color:#E7E7E7;
border-left-color:#E7E7E7;
border-bottom-color: #E7E7E7;
border-right-color: #E7E7E7;
border-radius: 7px;
cursor: pointer;
color:gray;
padding-top: -10px;
}
.btn1:hover{
	color:black;
}
.btn2{
width:200px;
height:50px;
background-color:light-gray;
border-style: solid;
border-top-color:#E7E7E7;
border-left-color:#E7E7E7;
border-bottom-color: #E7E7E7;
border-right-color: #E7E7E7;
border-radius: 7px;
cursor: pointer;
font-size:20px;
margin-right:50px;
}
#div1{
	text-align:center;
}
#div2{
	display: flex;
	justify-content: center;
}
</style>
<script>

</script>
</head>
<body>
<%
if(sid==null){
	%>
	<script>
		window.alert('로그인 후 이용 가능');
		location.href='/ezenstyle/member/memberLogin.jsp';
	</script>
	<% 
	return;
}
%>
<%@include file="../header.jsp" %>
<section>
	<article id="art1">
		<h3>장바구니</h3>
		<form name="qtt">
		<table>
		<caption class="blind" >장바구니 목록</caption>
		<tr>
		<%
		ArrayList<CartDTO> arr=cdao.showCart(sid);
		if(arr==null || arr.size()==0){
			%>
			<td colspan="2">장바구니에 담긴 상품이 없습니다.</td>
			<% 
		}else{	
			for(int i=0;i<arr.size();i++){	
		%>
				<td rowspan="3"><img src="/ezenstyle/goods/imgs/<%=arr.get(i).getG_nfile()%>"></td>
				<td colspan="2">상품명:<%=arr.get(i).getG_name() %></td>
				<td rowspan="3" align="right">가격:<%=df.format(arr.get(i).getG_price()*arr.get(i).getOrdernum())%></td>
				<td align="right"><input type="button" value="X" class="btn1" onclick="location.href='deleteCart_ok.jsp?c_idx=<%=arr.get(i).getC_idx() %>&g_idx=<%= arr.get(i).getG_idx() %>'"></td>
			</tr>
			<tr>
				<td colspan="2" ><%=arr.get(i).getG_category() %></td>
				<td></td>
			</tr>
			<tr>
				<td >사이즈:Free</td>
				<td>수량:<%=arr.get(i).getOrdernum() %><input type="button" value="주문수정" onclick="javascript:window.open('openPopup.jsp?c_idx=<%=arr.get(i).getC_idx()%>','popup','width=50,heigth=50,top=100');">
			</tr>
			<tr>
			<%
			total=total+(arr.get(i).getOrdernum()*arr.get(i).getG_price()); // 총 가격 누적
			}
		}
		%>
			</tr>
		</table>
		<div id="div1">
			<label>총 가격 | <%=df.format(total) %></label>
		</div>
		<div id="div2">
			<input type="button" value="계속 쇼핑하기" class="btn2" onclick="javascript:history.go(-1)">
			<input type="button" value="결제하기" class="btn2" onclick="location.href='/ezenstyle/orderInput.jsp'">
		</div>
		</form>
		
	</article>	
</section>
<%@include file="../footer.jsp" %>
</body>
</html>