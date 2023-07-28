<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.member.*" %>
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
<script>
function shownew(){
	document.orderaddr.name.value='';
	document.orderaddr.addr.value='';
	document.orderaddr.tel.value='';
}
function showmem(){
	document.orderaddr.name.value='<%=dto.getName() %>';
	
	document.orderaddr.addr.value='<%=dto.getAdr() %>';
	document.orderaddr.tel.value='<%=dto.getTel() %>';
	<%boolean readch=true;%>
	
}
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
<%@include file="header.jsp" %>
<section>
	<article>
	<h3>상품정보</h3>
	<fieldset>
		<table>
		<caption class="blind" >결제 예정 목록</caption>
			<tr>
				<td rowspan="3"><img src="/ezenstyle/img/shoes/s1.jpg"></td>
				<td colspan="2">Yellow T-shirts</td>
				<td rowspan="3" align="right">가격:200000</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2" >shoes/trainers</td>
				<td></td>
			</tr>
			<tr>
				<td>사이즈:Free</td>
				<td>수량:2</td>
				<td></td>
			</tr>
		</table>
		</fieldset>
	</article>
		<article>
	<h3>배송지정보</h3>
	<form name="orderaddr">
	<input type="radio" name="addr" value="newaddr" onclick="shownew()">신규배송지
	<input type="radio" name="addr" value="memberaddr" onclick="showmem()">최근배송지<br>
	<label>수령인</label>
	<input type="text" name="name" <%=readch?"readonly":"" %>><br>
	<label>주소</label>
	<input type="text" name="addr" <%=readch?"readonly":"" %>><br>
	<label>전화번호</label>
	<input type="text" name="tel" <%=readch?"readonly":"" %>><br>
	
	
	</form>
	<fieldset>
	<ul>
		<li><%=dto.getName() %>(<%=dto.getEmail() %>)</li>
		<li><%=dto.getTel() %></li>	
		<li><%=dto.getAdr() %></li>
	</ul>
	</fieldset>
	</article>
	<article>
	<table>
			<tr align="center">
			<td><input type="button" value="장바구니로 가기" class="btn2" onclick="javascript:location.href='/ezenstyle/member/memberCart.jsp'"></td>
			<td><input type="button" value="결제하기" class="btn3"></td>
			</tr>
		</table>
	</article>

</section>
<%@include file="footer.jsp" %>
</body>
</html>