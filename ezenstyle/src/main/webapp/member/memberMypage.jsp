<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ezenstyle.member.*" %>
<%
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
#container {display: flex;}
#box1{flex:1;background-color: blue;}
#box2{flex:1;background-color: orange;}
#box3{flex:1;background-color: gray;}
#ul1{margin-left:100px;}
table{margin-left:100px;}
li{
list-style-type:none;
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
			<td> 이름 </td><td><%=dto.getName()%></td>
			</tr>
			<tr>
			<td> 아이디 </td><td><%=dto.getId()%></td>
			</tr>
			<tr>
			<td> 비밀번호 </td><td><%=dto.getId()%></td>
			</tr>
			<tr>
			<td> 주소 </td><td><%=dto.getAdr()%></td>
			</tr>
			<tr>
			<td> 휴대전화 </td><td><%=dto.getTel()%></td>
			</tr>
			<tr>
			<td> 이메일 </td><td><%=dto.getEmail()%></td>
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
<form name="updateinfo">
<ul>
	<li> 상세 정보 수정</li>
	<li><br>비밀번호 * <input type="text" name="pwd"> <input type="submit" value="확인"></li>
</ul>
</form>
<form name="updateinfo2" action="memberMypage_ok.jsp">
<table>
<%if(dto1 == null){
	%>
	
	<%
}else{
	%>
	<tr>
	<td>이름 : </td><td><input type="text" name="name" value="<%=dto1.getName() %>"> </td>
	</tr>
	<tr>
	<td>비밀번호 : </td><td><input type="text" name="pwd" value="<%=dto1.getPwd() %>"> </td>
	</tr>
	<tr>
	<td>주소 : </td><td><input type="text" name="adr" value="<%=dto1.getAdr() %>"> </td>
	</tr>
	<tr>
	<td>휴대전화 : </td><td><input type="text" name="tel" value="<%=dto1.getTel() %>"> </td>
	</tr>
	<tr>
	<td>이메일 : </td><td><input type="text" name="email" value="<%=dto1.getEmail() %>"> </td>
	</tr>
	<tr>
	<td cospan="2"> <input type="submit" value="수정"> </td>
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