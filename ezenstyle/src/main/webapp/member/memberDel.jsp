<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/semiLayout.css">
<style>
article{
width: 800px;
height: 300px;
margin: 0px auto;
text-align: center;
}
.btn1{
margin-left:15px;
width:100px;
height:40px;
background-color: white;
border-style: solid;
border-top-color:#E7E7E7;
border-left-color:#E7E7E7;
border-bottom-color: #E7E7E7;
border-right-color: #E7E7E7;
border-radius: 5px;
}
#texth4{
color: red;
}

</style>
</head>
<body>
<%@include file="../header.jsp" %>

<section>
	<article>
		<br>
		<h2>정말로 회원탈퇴를 하시겠습니까??</h2>
		<br>
		<h4 id="texth4">구매내역 및 장바구니의 내용이 전부 사라집니다!</h4>
		<br>
		<button class="btn1" onclick="location.href='memberDel_ok.jsp'">회원 탈퇴</button>
		<button class="btn1" onclick="location.href='memberMypage.jsp'">뒤로 가기</button>
		
	</article>
</section>

<%@include file="../footer.jsp" %>
</body>
</html>