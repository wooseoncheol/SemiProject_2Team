<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.member.*" %>
<%@ page import="com.ezenstyle.goods.*" %>
<jsp:useBean id="idao" class="com.ezenstyle.goods.GoodsDAO"></jsp:useBean>
<jsp:useBean id="mdao" class="com.ezenstyle.member.MemberDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String sid = (String) session.getAttribute("sid");
String idx_s = request.getParameter("idx");
String ordernum=request.getParameter("g_stock");
int idx = Integer.parseInt(idx_s);
GoodsDTO dto1 = idao.showGoodscontent(idx);
MemberDTO dto = mdao.printMember(sid);
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
<%@include file="../header.jsp" %>
<section>
	<article>
		<h3>상품정보</h3>
		<form name="orderNow" action="orderNow_ok.jsp" method="post">
			<table>
				<caption class="blind" >결제 예정 목록</caption>
				<tr>
				<td rowspan="3"><img src="/ezenstyle/goods/imgs/<%=dto1.getG_nfile()%>"></td>
				<td colspan="2"><%=dto1.getG_name() %></td>
				<td rowspan="3" align="right"><%=dto1.getG_price() %></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2" ><%=dto1.getG_category() %></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3">사이즈:<%=dto1.getG_size() %> | 수량:<%=ordernum %></td>
			</tr>
			</table>
		</form>
	</article>
	<article>
	<h3>배송지정보</h3>
	<form name="orderNow" action="orderNow_ok.jsp" method="post">
	<input type="hidden" name="idx" value="<%=idx %>">
	<input type="hidden" name="g_stock" value="<%=ordernum %>">
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
<%@include file="../footer.jsp" %>
</body>
</html>