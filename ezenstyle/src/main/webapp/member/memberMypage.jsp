<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ezenstyle.member.*" %>
<%
request.setCharacterEncoding("utf-8");
String sid=(String)session.getAttribute("sid");
String upwd = request.getParameter("pwd");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/semiLayout.css">
<style>
#container {display: flex;padding-top: 30px;}
#box1{flex:1;padding-top: 15px;}
#box2{flex:1;padding-top: 32px;}
#box3{flex:1;padding-top: 15px;}
#ul1{margin-left:70px;}
.tname{
text-align: center;
}
#box2 table{margin-left:50px;}
#box2 table tr th{padding-bottom: 30px;}
#box2 table tr td{height: 45px;}
#box3 table{margin-left:80px;}
#box3 table tr td{height: 35px;}

#lname{
text-align: center;
}
li{
list-style-type:none;
}
.btn1{
margin-left:15px;
width:50px;
height:28px;
background-color: white;
border-style: solid;
border-top-color:#E7E7E7;
border-left-color:#E7E7E7;
border-bottom-color: #E7E7E7;
border-right-color: #E7E7E7;
border-radius: 5px;
}
.btn2{
margin-top:20px;
width:200px;
height:35px;
background-color: white;
border-style: solid;
border-top-color:#E7E7E7;
border-left-color:#E7E7E7;
border-bottom-color: #E7E7E7;
border-right-color: #E7E7E7;
border-radius: 7px;
}
.atd{
text-align: center;
}
.a{
width:200px;
border-style: solid;
outline:none;
border-top: 0px;
border-left: 0px;
border-right: 0px;
border-bottom: ;
border-color: #D5D5D5;
font-size: 17px;
}

</style>
</head>
<body>
<%
if(sid==null){
	%>
	<script>
		window.alert('로그인후 이용가능');
		location.href='/ezenstyle/main.jsp';
	</script>
	<%
	return;
} %>
<!-- 회원 정보 마스킹-->
<jsp:useBean id="mdto" class="com.ezenstyle.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.ezenstyle.member.MemberDAO"></jsp:useBean>

<!-- 회원 정보 수정-->
<jsp:useBean id="m1dto" class="com.ezenstyle.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="m1dto"/>
<jsp:useBean id="m1dao" class="com.ezenstyle.member.MemberDAO"></jsp:useBean>
<%@include file="../header.jsp" %>
<% 
ArrayList<MemberDTO> arr=mdao.getuserInfo(sid);
MemberDTO dto1=m1dao.updateInfo1(sid,upwd);
%>
<div id="container">
<div id="box1">
<ul id="ul1">
	<li><h4>내 정보 보기 및 수정</h4></li>
	<li><a href="/ezenstyle/member/memberCart.jsp">장바구니</a></li>
	<li><br><a>구매 내역</a></li>
</ul>
</div>

<div id="box2"> 
<table>
	<tr>
	<th class="tname" colspan="2">* 내 정보 보기 *</th>
	</tr>
	<%
	if(arr==null||arr.size()==0){
		%>
		<tr>
			<td>에러</td>
		</tr>
		<%
	}else{
		for(int i = 0 ; i < arr.size();i++){
			MemberDTO dto=arr.get(i);
			%>
			<tr>
			<td> 이름 </td><td>&nbsp;&nbsp;&nbsp;<%=dto.getName()%></td>
			</tr>
			<tr>
			<td> 아이디 </td><td>&nbsp;&nbsp;&nbsp;<%=dto.getId()%></td>
			</tr>
			<tr>
			<td> 비밀번호 </td><td>&nbsp;&nbsp;&nbsp;<%=dto.getId()%></td>
			</tr>
			<tr>
			<td> 주소 </td><td>&nbsp;&nbsp;&nbsp;<%=dto.getAdr()%></td>
			</tr>
			<tr>
			<td> 휴대전화 </td><td>&nbsp;&nbsp;&nbsp;<%=dto.getTel()%></td>
			</tr>
			<tr>
			<td> 이메일 </td><td>&nbsp;&nbsp;&nbsp;<%=dto.getEmail()%></td>
			</tr>
			<tr>
			<td>
			</td>
			</tr>
			<%
		}
	}
	%>
</table>
</div>

<div id="box3">
<form name="updateinfo" method="post">
<ul>
	<li class="lname"> <h4>* 상세 정보 수정 *</h4> </li>
	<li><br>비밀번호 * <input class="a" type="text" name="pwd"> <input class="btn1" type="submit" value="확인"></li>
</ul>
</form>
<form name="updateinfo2" action="memberMypage_ok.jsp" method="post">
<table>
<%if(dto1 == null){
	%>
	
	<%
}else{
	%>
	<tr>
	<td>이름  &nbsp;&nbsp;</td><td><input class="a" type="text" name="name" value="<%=dto1.getName() %>"> </td>
	</tr>
	<tr>
	<td>비밀번호  &nbsp;&nbsp;</td><td><input class="a" type="text" name="pwd" value="<%=dto1.getPwd() %>"> </td>
	</tr>
	<tr>
	<td>주소  &nbsp;&nbsp;</td><td><input class="a" type="text" name="adr" value="<%=dto1.getAdr() %>"> </td>
	</tr>
	<tr>
	<td>휴대전화  &nbsp;&nbsp;</td><td><input class="a" type="text" name="tel" value="<%=dto1.getTel() %>"> </td>
	</tr>
	<tr>
	<td>이메일  &nbsp;&nbsp;</td><td><input class="a" type="text" name="email" value="<%=dto1.getEmail() %>"> </td>
	</tr>
	<tr>
	<td colspan="2" class="atd"> <input class="btn2" type="submit" value="수정"> </td>
	</tr>
	<%
} 
%>
</table>
</form>
</div>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>