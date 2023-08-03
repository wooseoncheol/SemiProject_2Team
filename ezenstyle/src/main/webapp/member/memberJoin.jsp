<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	request.setCharacterEncoding("UTF-8");   
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/semiLayout.css">
<style>
.div1{
height:600px;
width:450px;
padding-top:50px;
margin: 0px auto;
}
.a{
width:200px;
border-style: solid;
outline:none;
border-top: 0px;
border-left: 0px;
border-right: 0px;
border-bottom: ;
border-color: #898989;
font-size: 17px;
}
#question{
	width:205px;
	border-style: solid;
	border-width: 2px;
	outline:none;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: ;
	border-color: #898989;
}
#t{
font-size: 9px;
}
.btn1{
width:340px;
height:35px;
background-color: white;
border-style: solid;
border-top-color:#E7E7E7;
border-left-color:#E7E7E7;
border-bottom-color: #E7E7E7;
border-right-color: #E7E7E7;
border-radius: 7px;
cursor: pointer;
}
.btn2{
margin-left:15px;
width:80px;
height:28px;
background-color: white;
border-style: solid;
border-top-color:#E7E7E7;
border-left-color:#E7E7E7;
border-bottom-color: #E7E7E7;
border-right-color: #E7E7E7;
border-radius: 5px;
}
section article form table tr{
height: 55px;
}
.atr{
height: 80px;
}
.atd{
text-align: center;
}

</style>
<script>
//id가 null일때, 비밀번호와 비밀번호 확인과 다를때
function gojoin(){
	var uid = document.memberjoin.id.value;
	var upwd = document.memberjoin.pwd.value;
	var upwd1 = document.memberjoin.pwd1.value;
	
	if(uid == null || uid==''){
		window.alert('아아디를 입력하세요!');
	}else {
		if(upwd == upwd1){
			document.memberjoin.submit();
		}else{
			window.alert('비밀번호가 다릅니다');
		}
	}
}
function show(){
	window.open('idcheck.jsp','popup','width=400,height=220,top=400,left=1300');
}
//tel - 숫자만 입력받게
function checkNumber(event) {
	  if(event.key >= 0 && event.key <= 9) {
	    return true;
	  }
	  
	  return false;
	}
</script>
</head>
<body>
<%@include file="../header.jsp" %>
<section>
	<article>
		<form name="memberjoin" action="memberJoin_ok.jsp" method="post">
		<div class="div1">
		<table>
		<tr>
			<td>이름 * </td><td>&nbsp;&nbsp;<input class="a" type="text" name="name" required="required"></td>
		</tr>
		<tr>
			<td>아이디 * </td><td>&nbsp;&nbsp;<input class="a" type="text" name="id" readonly="readonly" required="required"></td>
			<td>&nbsp;&nbsp;<input class="btn2" type="button" name="duid" value="중복검사" onclick="show()"></td>
		</tr>
		<tr>
			<td>비밀번호 * </td><td>&nbsp;&nbsp;<input class="a" type="password" name="pwd1" required="required"></td>
		</tr>
		<tr>
			<td>비밀번호 확인* </td><td>&nbsp;&nbsp;<input class="a" type="password" name="pwd" required="required"></td>
		</tr>
		<tr>
			<td>본인확인 질문*</td>
			<td>&nbsp;&nbsp;<select id="question" name="question" required>
          		<option value="가장 좋아하는 동물은?">가장 좋아하는 동물은?</option>
            	<option value="자신의 출신 초등학교는?">자신의 출신 초등학교는?</option>
            	<option value="가장 감명깊게 읽은 책의 제목은?">가장 감명깊게 읽은 책의 제목은?</option>
            	<option value="자신의 반려동물 이름은?">자신의 반려동물 이름은?</option>
            	<option value="자신의 보물1호는?">자신의 보물1호는?</option>
            	</select></td>
		</tr>
		<tr>
			<td>본인확인 답변*</td>
			<td>&nbsp;&nbsp;<input class="a" type="text" name="answer" required="required"></td>
		</tr>
		<tr>
			<td>주소 * </td><td>&nbsp;&nbsp;<input class="a" type="text" name="adr" required="required"></td>
		</tr>
		<tr>
			<td>휴대전화 *<br><span id="t">&nbsp;&nbsp;(&nbsp;-&nbsp;제외&nbsp;)</span></td><td>&nbsp;&nbsp;<input class="a" type="text" name="tel" required="required" onkeypress="return checkNumber(event)"></td>
		</tr>
		<tr>
			<td>이메일 * </td><td>&nbsp;&nbsp;<input class="a" type="text" name="email" required="required"></td>
		</tr>
		<tr class="atr">
			<td colspan="3" class="atd"><input class="btn1" type="button" value="가입" onclick="gojoin()">
			</td>
		</tr>
		</table>
		</div>
		</form>
	</article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>