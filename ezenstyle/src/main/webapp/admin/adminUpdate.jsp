<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/ezenstyle/css/semiLayout.css">
<style>
h3 {
text-align: center;
}
table {
margin-right: auto;
margin-left: auto;
margin-top: 100px;
margin-bottom: 100px;
width: 800px;
height:300px;
border-collapse: collapse;
}
table {
height: 70px;
text-align:center;
border-bottom: 3px solid #F0F0F0;
border-top: 3px solid #F0F0F0;
}
.a {
height: 50px;
text-align:center;
border-bottom: 3px solid #F0F0F0;
border-top: 3px solid #F0F0F0;
}
.b {
margin:0px auto;
height: 300px;
width: 300px;
object-fit:contain;
}
.b {display:block;}
select {
border-radius: 15px;
border: 2px solid #BDBDBD;
padding: .2em .3em;
}
input[type=text] {
border-top: none;
border-left: none;
border-right: none;
border-bottom: 2px solid #BDBDBD;
outline: none;
}
.uuu{
text-align: left;
text-indent: 40px;
}
input[type=submit] {
background: none;
border: 3px solid #BDBDBD;
border-radius: 5px;
cursor: pointer;
}
input[type=reset] {
background: none;
border: 3px solid #BDBDBD;
border-radius: 5px;
cursor: pointer;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
<% 
String idx_s=request.getParameter("idx");
int idx=Integer.parseInt(idx_s);
String name=request.getParameter("name");
String color=request.getParameter("color");
String size=request.getParameter("size");
String stock_s=request.getParameter("stock");
int stock=Integer.parseInt(stock_s);
String price_s=request.getParameter("price");
int price=Integer.parseInt(price_s);
String detail=request.getParameter("detail");
String nfile=request.getParameter("nfile");
String category=request.getParameter("category");
%>	
		<form name="adminUpdate" action="adminUpdate_ok.jsp">
		<h3>상품 수정 페이지</h3>
			<table>
				<tbody>	
				<tr class="a">
					<td rowspan="8"><img src="/ezenstyle/goods/imgs/<%=nfile %>" class="b"></td>
					<td>상품번호</td>
					<td><input type="text" name="idx" value=<%=idx %> readonly></td>
				</tr>
				<tr class="a">
					<td>카테고리</td>
					<td class="uuu"><select name="g_category">
						<option value="man" <%if(category.equals("man")) {%>selected="selected"<%} %>>MAN</option>
						<option value="woman"<%if(category.equals("woman")) {%>selected="selected"<%} %>>WOMAN</option>
						<option value="kid"<%if(category.equals("kid")) {%>selected="selected"<%} %>>KID</option>
						<option value="accessories"<%if(category.equals("accessories")) {%>selected="selected"<%} %>>ACCESSORIES</option>
						<option value="shoes"<%if(category.equals("shoes")) {%>selected="selected"<%} %>>SHOES</option>
						</select>
					</td>
				</tr>
				<tr class="a">
					<td>상품명</td>
					<td><input type="text" name="name" value=<%=name.replaceAll("nbsp", "&nbsp;") %>></td>
				</tr>
				<tr class="a">	
					<td>가격</td>
					<td><input type="text" name="price" value=<%=price %>></td>
				</tr>
				<tr class="a">
					<td>컬러</td>
					<td><input type="text" name="color" value=<%=color %>></td>
				</tr>
				<tr class="a">
					<td>사이즈</td>
					<td><input type="text" name="size" value=<%=size %>></td>
				</tr>
				<tr class="a">
					<td>재고</td>
					<td><input type="text" name="stock" value=<%=stock %>></td>
				</tr>
				<tr class="a">
					<td>세부</td>
					<td><textarea rows="5" cols="30" name="detail"><%=detail.replaceAll("\r\n", "<br>") %></textarea></td>
				</tr>
				<tr class="a">
					<td colspan="3"><input type="submit" value="수정">
					&nbsp;&nbsp;&nbsp;<input type="reset"	value="다시작성"></td>
				</tr>
				</tbody>
			</table>
		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>