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
li{
	list-style-type: none;
}
img{
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
table{
	width:800px;
	height:130px;
	margin:0px auto;
}
table td{
	font-size:18px;
}
h3{
	margin-left:15px;
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
	<fieldset>
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
				<td><%=arr.get(i).getG_size() %></td>
				<td><%=arr.get(i).getOrdernum() %></td>
				<td></td>
			</tr>
				<%
			}
		}
		%>
		
		</table>
		</fieldset>
	</article>
	
	<article>
	<h3>배송지정보</h3>
	<form name="orderInput" action="orderInput_ok.jsp" method="post">
	<fieldset>
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
			<tr align="center">
				<td><input type="button" value="장바구니로 가기" class="btn2" onclick="javascript:location.href='/ezenstyle/member/memberCart.jsp'"></td>
				<td><input type="submit" value="결제하기" class="btn3"></td>
				</tr>
		</table>
	</fieldset>
	</form>
	</article>


</section>
<%@include file="footer.jsp" %>
</body>
</html>