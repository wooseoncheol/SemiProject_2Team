<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/semiLayout.css">
<style>
.ay{
	margin-top: 80px;
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
table{
	margin: 90px auto;
	text-align: center;
	height: 300px;
}
input[type=password] {
border-top: none;
border-left: none;
border-right: none;
border-bottom: 2px solid #BDBDBD;
outline: none;
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>

<section>
	<article>
	<form name="memberDel" action="memberDel_ok.jsp" method="post">
		<h2 class="ay">정말로 회원탈퇴를 하시겠습니까?</h2>
			<table>
			<tr>
				<th colspan="2" id="texth4">구매내역 및 장바구니의 내용이 전부 사라집니다!</th>
			</tr>
			<tr>
				<th colspan="2">탈퇴하시려면 비밀번호를 입력해주세요.</th>
			</tr>
			<tr>
				
			</tr>	
			<tr>
				<td colspan="2"> 비밀번호:&nbsp;&nbsp;<input type="password" name="checkpwd"></td>
			</tr>
			<tr>
				<td><input type="button" class="btn1" value="뒤로 가기" onclick="location.href='memberMypage.jsp'"></td>
				<td><input type="submit" class="btn1" value="회원 탈퇴"></td>
			</tr>	
		</table>
		</form>
	</article>
</section>

<%@include file="../footer.jsp" %>
</body>
</html>