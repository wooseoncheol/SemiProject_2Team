<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/ezenstyle/css/semiLayout.css">
<style>
#idsearch{
	margin-left: 150px;
	margin-top: 50px;
	margin-right: 170px;
	margin-bottom: 50px;
	float: left;
}
#pwdsearch{
	margin-top: 80px;
	margin-right: 50px;
	float: left;
}
th{
	text-align: center;
}
#question{
	width:350px;
	border-style: solid;
	border-width: 2px;
	outline:none;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: ;
	border-color: #898989;
	font-size: 17px;
}
#se{
	padding-bottom: 50px;
}
#a{
	width:350px;
	border-style: solid;
	outline:none;
	border-top: 0px;
	border-left: 0px;
	border-right: 0px;
	border-bottom: ;
	border-color: #898989;
	font-size: 17px;
}
#b{
	width:350px;
	height:35px;
	background-color:white;
	border-style: solid;
	border-top-color:#E7E7E7;
	border-left-color:#E7E7E7;
	border-bottom-color: #E7E7E7;
	border-right-color: #E7E7E7;
	border-radius: 7px;
	cursor: pointer;
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
<%@include file="/header.jsp" %>
<form name="idsearch" action="idSearch_ok.jsp" method="post">
	<table id="idsearch">
		<tr>
			<th align="center" id="se">아이디 찾기</th>
		</tr>
		<tr>
			<td>이름</td>
		</tr>
		<tr>
			<td><br><input type="text" name="name" id="a"></td>
		</tr>
		<tr>
			<td><br>휴대전화</td>
		</tr>
		<tr>
			<td><br><input type="text" name="tel" id="a" onkeypress="return checkNumber(event)" onkeyup="formatPhoneNumber(this)" maxlength="13"></td>
		</tr>
		<tr>
			<td><br>본인확인 질문</td>
		</tr>
		<tr>
			<td><br><select id="question" name="question" required>
          		<option value="가장 좋아하는 동물은?">가장 좋아하는 동물은?</option>
            	<option value="자신의 출신 초등학교는?">자신의 출신 초등학교는?</option>
            	<option value="가장 감명깊게 읽은 책의 제목은?">가장 감명깊게 읽은 책의 제목은?</option>
            	<option value="자신의 반려동물 이름은?">자신의 반려동물 이름은?</option>
            	<option value="자신의 보물1호는?">자신의 보물1호는?</option>
            	</select></td>
		</tr>
		<tr>
			<td><br>본인확인 답변</td>
		</tr>
		<tr>
			<td><br><input id="a" type="text" name="answer" required="required"></td>
		</tr>
		<tr>
			<td><br><br><input type="submit" value="아이디 찾기"  id="b">
		</tr>
	</table>
</form>
<form name="pwdsearch" action="pwdSearch_ok.jsp" method="post">
	<table id="pwdsearch">
		<tr>
			<th align="center" id="se">비밀번호 찾기</th>
		</tr>
		<tr>
			<td>아이디</td>
		</tr>
		<tr>
			<td><br><input type="text" name="id" id="a" required="required"></td>
		</tr>
		<tr>
			<td><br>이름</td>
		</tr>
		<tr>
			<td><br><input type="text" name="name" id="a" required="required"></td>
		</tr>
		<tr>
			<td><br>휴대전화</td>
		</tr>
		<tr>
			<td><br><input type="text" name="tel" id="a" required="required" onkeypress="return checkNumber(event)" onkeyup="formatPhoneNumber(this)" maxlength="13"></td>
		</tr>
		<tr>
			<td><br><br><input type="submit" value="비밀번호 찾기" id="b">
		</tr>
	</table>
</form>

<%@include file="/footer.jsp" %>
</body>
</html>