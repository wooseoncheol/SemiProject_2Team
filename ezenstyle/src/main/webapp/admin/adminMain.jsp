<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/ezenstyle/css/semiLayout.css">
<style>
#container {display: flex;padding-top: 30px;}
#box1{flex:1;padding-top: 15px;background-color: orange;}
#box2{flex:2;padding-top: 32px;display: flex;}
#box3{flex:1;padding-top: 15px;background-color: lime;}

#box1 ul{
padding-left: 180px;
}
#box1 ul li{
list-style-type:none;
height: 50px;
}
#box2 table{
margin:0px auto;
}
.g_pic{
width:200px;
height: 200px;
}

</style>
</head>
<body>
<%@include file="/header.jsp" %>
<div id="container">

<div id="box1">
<ul>
<li><a href="adminCategory.jsp?category=man">MAN</a></li>
<li><a href="adminCategory.jsp?category=woman">WOMAN</a></li>
<li><a href="adminCategory.jsp?category=kid">KID</a></li>
<li><a href="adminCategory.jsp?category=accessories">ACCESSORIES</a></li>
<li><a href="adminCategory.jsp?category=shoes">SHOES</a></li>
</ul>
</div>

<div id="box2">
	<table border="1">
	<tr>
	<td class="g_pic">사진</td><td>카테고리 : MAN <br>상품 번호: 123 | 이름 : 셔츠 | 가격 : 38,000원<br>재고 | 나머지 정보들</td>
	</tr>
	<tr>
	<td class="g_pic">사진</td><td>카테고리 : WOMAN <br>상품 번호: 123 | 이름 : 셔츠 | 가격 : 29,000원<br>재고 | 나머지 정보들</td>
	</tr>
	</table>
</div>

<div id="box3">
<h2><a href="adminGsubmit.jsp">상품 등록+</a></h2>
</div>

</div>
<%@include file="/footer.jsp" %>
</body>
</html>