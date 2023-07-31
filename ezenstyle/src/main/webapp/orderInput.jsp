<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.member.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.ezenstyle.cart.*" %>
<jsp:useBean id="mdao" class="com.ezenstyle.member.MemberDAO"></jsp:useBean>
<jsp:useBean id="cdao" class="com.ezenstyle.cart.CartDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String sid=(String)session.getAttribute("sid");

MemberDTO dto=mdao.printMember(sid);



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/semiLayout.css">
<style>
section li{
	list-style-type: none;
}
section img{
	width: 150px;
	height: 200px;
	margin-right: -80px;
}
.blind {
  position: absolute;
  width: 1px;
  height: 1px;
  clip: rect(0 0 0 0);
  overflow: hidden;
}
section table{
	width:800px;
	height:130px;
	margin-right: auto;
	margin-left: auto;
	margin-top: 10px;
	margin-bottom: 100px;
	border-collapse: collapse;
	border-top: 3px solid #F0F0F0;
	border-bottom: 3px solid #F0F0F0;

}
section table td{
	font-size:18px;
}
section h3{
	margin-top:100px;
	margin-left:200px;
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
.btn3{
width:200px;
height:50px;
background-color:gray;
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
</style>

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
<%@include file="header.jsp" %>
<section>
	<article>
	<h3>상품정보</h3>
		<table>
		<caption class="blind" >결제 예정 목록</caption>
		<%
		ArrayList<CartDTO> arr=cdao.showCart(sid);
		
		if(arr==null || arr.size()==0){
			%>
			<tr>
				<td>장바구니에 담긴 상품이 없습니다</td>
			</tr>
			<%
		}else{
			for(int i=0;i<arr.size();i++){
				%>
				<tr>
				<td rowspan="3"><img src="/ezenstyle/goods/imgs/<%=arr.get(i).getG_nfile()%>"></td>
				<td colspan="2"><%=arr.get(i).getG_name() %></td>
				<td rowspan="3" align="right"><%=arr.get(i).getG_price() %></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2" ><%=arr.get(i).getG_category() %></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3">사이즈:<%=arr.get(i).getG_size() %> | 수량:<%=arr.get(i).getOrdernum() %></td>
			</tr>
				<%
			}
		}
		%>
		
		</table>
	</article>
	
	<article>
	<h3>배송지정보</h3>
	<form name="orderInput" action="orderInput_ok.jsp" method="post">

		<table>
			<tr>
				<td>받으시는 분</td>
				<td><input type="text" name="name" value="<%=dto.getName() %>"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value="<%=dto.getAdr() %>"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="tel" value="<%=dto.getTel() %>"></td>
			</tr>
		</table>
		<div align="center">
			<input type="button" value="장바구니로 가기" class="btn2" onclick="location.href='/ezenstyle/member/memberCart.jsp'">
			<input type="submit" value="결제하기" class="btn3">
		</div>
	</form>
	</article>


</section>
<%@include file="footer.jsp" %>
</body>
</html>