<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.member.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.ezenstyle.cart.*" %>
<jsp:useBean id="mdao" class="com.ezenstyle.member.MemberDAO"></jsp:useBean>
<jsp:useBean id="cdao" class="com.ezenstyle.cart.CartDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String sid=(String)session.getAttribute("sid");

MemberDTO dto=mdao.printMember(sid);

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
<link rel="stylesheet" type="text/css" href="css/semiLayout.css">
<style>
section li{
	list-style-type: none;
}
section img{
	width: 150px;
	height: 200px;
	margin-top:3px;
	margin-right: -105px;
}
.blind {
  position: absolute;
  width: 1px;
  height: 1px;
  clip: rect(0 0 0 0);
  overflow: hidden;
}
section table{
	background-color:#F1F6F9;
	width:1000px;
	height:130px;
	margin-right: auto;
	margin-left: auto;
	margin-top: 0px;
	margin-bottom: 100px;
	border-collapse: collapse;
	
	
}
#addr th{
	width:300px;
}
.tablet th{
	padding-top:10px;
	border-top: 3px solid #708090;
}
.tablet td{
	padding-top:10px;
	border-top: 3px solid #C0C0C0;

}
.tablet2{
	border-top: 3px solid #C0C0C0;
	border-bottom: 3px solid #9DB2BF;
	color: gray;
}
.tableb th{
	padding-bottom:12px;
	border-bottom: 3px solid #708090;
}
.tableb td{
	padding-bottom:12px;
	border-bottom: 3px solid #C0C0C0;
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
.textbox1{
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 2px solid #A9A9A9;
	width:150px;
	margin-left:20px;
	font-size:15px;
	background-color:#F1F6F9;
}
.textbox2{
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 2px solid #A9A9A9;
	width:260px;
	margin-left:20px;
	font-size:15px;
	background-color:#F1F6F9;
}
section table td{
	font-size:18px;
}
section h3{
	margin-top:50px;
	margin-left:100px;
}
.btn2{
width:120px;
height:40px;
background-color:white;
border-style: solid;
border-top-color:#BDBDBD;
border-left-color:#BDBDBD;
border-bottom-color: #BDBDBD;
border-right-color: #BDBDBD;
border-radius: 7px;
cursor: pointer;
}
.btn3{
width:120px;
height:40px;
background-color:#393B44;
color:white;
border-style: solid;
border-top-color:#BDBDBD;
border-left-color:#BDBDBD;
border-bottom-color: #BDBDBD;
border-right-color: #BDBDBD;
border-radius: 7px;
cursor: pointer;
}

.gimg{
	object-fit: cover;
}
</style>
<script>
function checkNumber(event) {
	  if(event.key >= 0 && event.key <= 9) {
	    return true;
	  }
	  return false;
}
function formatPhoneNumber(input) {
  var phoneNumber = input.value.replace(/\D/g, '');

  if (phoneNumber.length >= 4 && phoneNumber.length <= 7) {
      phoneNumber = phoneNumber.replace(/(\d{3})(\d{1,4})/, '$1-$2');
  } else if (phoneNumber.length >= 8) {
      phoneNumber = phoneNumber.replace(/(\d{3})(\d{4})(\d{1,4})/, '$1-$2-$3');
  }
  input.value = phoneNumber;
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
		<table>
		<caption class="blind" >결제 예정 목록</caption>
		<%
		ArrayList<CartDTO> arr=cdao.showCart(sid);
		
		if(arr==null || arr.size()==0){
			%>
			<script>
				window.alert('장바구니에 담긴 상품이 없습니다');
				window.location=document.referrer;
			</script>
			<%
		}else{
			for(int i=0;i<arr.size();i++){
				%>
				<tr class="tablet3">
				<td rowspan="3" style="padding-top: 3px; width: 157px;">
				<img src="/ezenstyle/goods/imgs/<%=arr.get(i).getG_nfile()%>" class="gimg"></td>
				<td colspan="2" style="padding-top: 10px;"><%=arr.get(i).getG_name() %></td>
				<td rowspan="3" align="right" style="color:#696969;"><b>
				<%=df.format(arr.get(i).getG_price()*arr.get(i).getOrdernum()) %>원</b></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2" style="padding-bottom:50px; color:#A9A9A9;"><%=arr.get(i).getG_category() %></td>
				<td></td>
			</tr>
			<tr class="tableb3">
				<td colspan="3"  style="padding-bottom:15px;">사이즈 : <%=arr.get(i).getG_size() %> &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp; 수량 : <%=arr.get(i).getOrdernum() %></td>
			</tr>
			
				<%
				total=total+arr.get(i).getG_price()*arr.get(i).getOrdernum();
			}
		}
		%>
		
		</table>
	</article>
	
	<article>
	<h3>배송지정보</h3>
	<form name="orderInput" action="orderInput_ok.jsp" method="post">
		<table id="addr">
			<tr class="tablet">
				<th>받으시는 분</th>
				<td><input type="text" name="name" value="<%=dto.getName() %>" class="textbox1" required="required"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel" value="<%=dto.getTel() %>" class="textbox1" onkeypress="return checkNumber(event)" onkeyup="formatPhoneNumber(this)" maxlength="13" required="required"></td>
			</tr>
			<tr class="tableb">
				<th>주소</th>
				<td><input type="text" name="addr" value="<%=dto.getAdr() %>" class="textbox2" required="required"></td>
			</tr>
		</table>
		<%
			if(total>=50000){ //5만원 이상 구매시 배송비 무료
				dilprice=0;
			}
			sum=total+dilprice;
			%>
		<h3>결제</h3>
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
		<div align="center" style="margin-bottom: 30px;">
			<input type="button" value="장바구니" class="btn2" onclick="location.href='/ezenstyle/member/memberCart.jsp'">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="결제하기" class="btn3">
		</div>
	</form>
	</article>
<br>

</section>
<%@include file="footer.jsp" %>
</body>
</html>