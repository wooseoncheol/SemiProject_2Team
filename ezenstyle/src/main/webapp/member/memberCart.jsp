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

DecimalFormat df=new DecimalFormat("###,###,###,###");

int total=0;
int dilprice=3000;
int sum=0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/semiLayout.css">
<style>
select {
border-radius: 15px;
border: 2px solid #BDBDBD;
height: 30px;
width: 60px;
padding: .2em .3em;
}
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
section table{
	width:1000px;
	height:130px;
	margin:0px auto;
	border-collapse: collapse;
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
background-color:#696969
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
color:white;
background-color:black;
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
.tablet2{
	border-top: 3px solid #C0C0C0;
	border-bottom: 3px solid #F0F0F0;
	color: gray;
}
.tableb2{
	border-bottom: 3px solid #C0C0C0;
	
}
.tablet3{
	border-top: 3px solid #C0C0C0;
}
.tableb3{
	border-bottom: 3px solid #C0C0C0;
}
#pricetable{
	width:1000px;
	height:130px;
	margin-right: auto;
	margin-left: auto;
	margin-top: 10px;
	margin-bottom: 100px;
	border-collapse: collapse;
	text-align: center;
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
function handleOnChange(e, idx) {
	  // 선택된 데이터 가져오기
	  const value = e.value;
	  
	  location.href="/ezenstyle/member/memberCart_ok.jsp?c_idx="+idx+"&ordernum="+value
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
<%@include file="../header.jsp" %>
<section>
	<article id="art1">
		<h3>장바구니</h3>
		<form name="qtt">
		<table>
		<caption class="blind" >장바구니 목록</caption>
		<%
		ArrayList<CartDTO> arr=cdao.showCart(sid);
		if(arr==null || arr.size()==0){
			%>
			<tr>
			<td colspan="2">장바구니에 담긴 상품이 없습니다.</td>
			</tr>
			<% 
		}else{	
			for(int i=0;i<arr.size();i++){	
		%>
			<tr class="tablet3">
				<td rowspan="3"><img src="/ezenstyle/goods/imgs/<%=arr.get(i).getG_nfile()%>"></td>
				<td colspan="2">상품명:<%=arr.get(i).getG_name() %></td>
				<td rowspan="3" align="right">가격:<%=df.format(arr.get(i).getG_price()*arr.get(i).getOrdernum())%></td>
				<td align="right"><input type="button" value="X" class="btn1" onclick="location.href='deleteCart_ok.jsp?c_idx=<%=arr.get(i).getC_idx() %>&g_idx=<%= arr.get(i).getG_idx() %>'"></td>
			</tr>
			<tr>
				<td colspan="2" style="color:#A9A9A9;"><%=arr.get(i).getG_category() %></td>
				<td></td>
			</tr>
			<tr>
				<td >사이즈:Free</td>
				<td>수량:
				<select name = 'g_stock' id='<%=arr.get(i).getC_idx()%>' onchange="handleOnChange(this, <%=arr.get(i).getC_idx()%>)">
				<% 
					for(int j = 1 ; j<=arr.get(i).getG_stock(); j++){
				%>		<%if(j!=arr.get(i).getOrdernum()){ %>
						<option value=<%=j%>><%=j %></option>
						<% 
						}else {
							%>
							<option value=<%=arr.get(i).getOrdernum()%> selected="selected"><%=arr.get(i).getOrdernum()%></option>
							<%
						}
					}
				%>
			</select>
			</tr>
			<tr class="tableb3">
			<%
			total=total+(arr.get(i).getOrdernum()*arr.get(i).getG_price()); // 총 가격 누적
			}
		}
		%>
			</tr>
		</table>
		<%
			if(total>=50000){ //5만원 이상 구매시 배송비 무료
				dilprice=0;
			}
			sum=total+dilprice;
			%>
		<h3>결제금액</h3>
		<table id="pricetable">
			<tr class="tablet2">
				<td>상품 금액</td>	
				<td>&nbsp;</td>			
				<td>배송비</td>
				<td>&nbsp;</td>				
				<td>총 결제 금액</td>				
			</tr>	
			<tr class="tableb2">
				<td><%=df.format(total) %>원</td>
				<td>+</td>				
				<td><%=df.format(dilprice) %>원</td>	
				<td>=</td>			
				<td><b><%=df.format(sum) %>원</b></td>
			</tr>
		</table>
		<div id="div2">
			<input type="button" value="계속 쇼핑하기" class="btn2" onclick="javascript:history.go(-1)">
			<input type="button" value="결제하기" class="btn3" onclick="location.href='/ezenstyle/orderInput.jsp'">
		</div>
		</form>
		
	</article>	
</section>
<%@include file="../footer.jsp" %>
</body>
</html>