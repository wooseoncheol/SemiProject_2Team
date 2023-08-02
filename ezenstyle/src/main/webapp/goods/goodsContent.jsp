<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.goods.*" %>
<%@ page import="java.text.*" %>
<jsp:useBean id="idao" class="com.ezenstyle.goods.GoodsDAO"></jsp:useBean>
<%
DecimalFormat df = new DecimalFormat("###,###,###");

String idx_s = request.getParameter("idx"); 
int idx = Integer.parseInt(idx_s); 
GoodsDTO dto = idao.showGoodscontent(idx);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section table{
width: 800px;
margin: 0px auto;
}
section li{
list-style-type:none;
width: 300px;
margin: center;
line-height: 50px;
font-size:15px;
}
#title{
font-size: 30px;
}
img{

width: 500px;
height: 600px; 
}
#button1{
text-align: center;
margin-left:15px;
width:150px;
height:50px;
background-color: white;
border-style: solid;
border-top-color:#E7E7E7;
border-left-color:#E7E7E7;
border-bottom-color:#E7E7E7;
border-right-color: #E7E7E7;
background-color: black;
color : white;
}
#button2{
text-align: center;
margin-left:15px;
width:150px;
height:50px;
background-color: white;
border-style: solid;
border-top-color:#E7E7E7;
border-left-color:#E7E7E7;
border-bottom-color:#E7E7E7;
border-right-color: #E7E7E7;
border-radius: 5px;
}
.g_inf{
border: 0px;
outline:none;
}
.g_number{
width: 40px;
outline:none;
}
#detail{
	line-height: 25px;
}
</style>
<link rel="stylesheet" type="text/css" href="../css/semiLayout.css">
</head>
<body>
<%@include file = "../header.jsp" %>
<section>
<form name = "fm" action="/ezenstyle/goods/goodsContent_ok.jsp">
<input type = hidden name="idx" value = <%=dto.getIdx() %>>
<input type = hidden name="g_nfile" value = <%=dto.getG_nfile()%>>
<input type = hidden name="g_category" value = <%=dto.getG_category()%>>
 <input type="hidden" name=g_price value="<%=dto.getG_price()%>">
<table>
		<tr>
			<td rowspan="3" id= "img"><img src="/ezenstyle/goods/imgs/<%=dto.getG_nfile() %>"></td>
			<td rowspan="3"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td colspan = "2">
			<ul>
			<li><input id= "title" type="text" name=g_name value="<%=dto.getG_name()%>" readonly class=g_inf></li>
			<li>가격: <%=df.format(dto.getG_price()) %>원</li>
			<li>색상: <input type="text" name=g_color value="<%=dto.getG_color()%>" readonly class=g_inf></li>
			<li>사이즈: <input type="text" name=g_size value="<%=dto.getG_size()%>" readonly class=g_inf></li>
			<li>구매수량:
			<% 
			if(dto.getG_stock()<=0){
			%>
				<input type = hidden name="g_stock" value = <%=dto.getG_stock()%>>
				<span>[품절]</span>
			<% 
			}else{
			%> 
			<select name=g_stock>
			<% 
				for(int i = 1 ; i<=dto.getG_stock(); i++){
					%>
					<option value=<%=i%>><%=i %></option>
					<% 
				}
			%>
			</select>
			<%
			}
			%>
			</li>
			<li id="detail"><%=dto.getG_detail().replaceAll("\n", "<br>")%></li>
			</ul>
			</td>
		</tr>
		<tr>
			<td ><input id="button1" name= "button" type = "submit" value = "바로구매"></td>
			<td ><input id="button2" name="button" type = "submit" value = "장바구니"></td>
		</tr>
		<tr>
			<td> &nbsp; </td>
			<td> &nbsp; </td>
		</tr>
	</table>
</form>
</section>
<%@include file = "../footer.jsp" %>
</body>
</html>