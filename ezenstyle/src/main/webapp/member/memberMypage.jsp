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
#container {display: flex;padding-top: 30px;padding-bottom: 30px;}
#box1{flex:1;padding-top: 15px;height: 370px}
#box2{flex:2.5;padding-top: 32px;}
#ul1{margin-left:70px;}
.tname{text-align: center;font-size:20px;}
#box2 table tr th{padding-bottom: 30px;}
#box2 table tr td{height: 45px;}


#lname{
text-align: center;font-size:20px;
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
display:none;
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
#memberbye{
color: red;
}
#tbody111{
margin-bottom: 150px;
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
	border-color: #D5D5D5;
}

#box2 fieldset{ text-align: left; border: 0px solid #777; width:800px; text-indent: 30px;}
#box2 fieldset legend{ font-size: 25px; font-weight: bold;background: white;}
#box2 fieldset #t123 {
margin-left:50px;
margin-top:50px; 
width:700px; height:200px; 
border-spacing: 20px 5px;
border-collapse: collapse;}

#box2 fieldset #t124 {margin-top: 60px; margin-left: 50px; text-align: left;}
#art2{margin-top:100px;}
#hrhrh1{width:500px;margin: 70px auto;}
h1{display: inline; fon}
.textb{font-weight: bold;font-size:20px;}

.tdmypage1 {
background-color: #F0F0F0;
border-color: 1px solid white;
border-radius: 10px;
text-align: center;
width: 200px;
height: 150px;
}

.tdmypage2 {
background-color: #F0F0F0;
border-color: 1px solid white;
border-top-left-radius: 10px;
border-bottom-left-radius: 10px;
text-align: center;
width: 70px;
}

.tdmypage22 {
background-color: #F0F0F0;
border-color: 1px solid white;
border-top-right-radius: 10px;
border-bottom-right-radius: 10px;
text-align: center;
width: 300px;
font-weight: bold;
font-size: 18px;
}

.tdmypage3 {
background-color: #F0F0F0;
border-color: 1px solid white;
border-top-left-radius: 10px;
border-top-right-radius: 10px;
text-align: center;
width: 300px;
}

.tdmypage4 {
background-color: #F0F0F0;
border-color: 1px solid white;
border-bottom-left-radius: 10px;
border-bottom-right-radius: 10px;
text-align: center;
width: 300px;
}

.tdnot{
width:10px;
}
.trnot{
height:10px;
}
.texta {
font-weight: bold;
font-size: 20px;
}
.imgmypage {
width : 30px;
height : 30px;
margin: auto 60px;
}
.imgmypage2 {
background: url("/ezenstyle/img/pwd2.png") no-repeat;
background-size: cover;
width : 25px;
height : 30px;
position : absolute;
cursor: pointer;
}
.imgmypage2:hover {
background: url("/ezenstyle/img/pwd3.png");
background-size: cover;
width : 35px;
height : 30px;
position : absolute;
cursor: pointer;
}

.imgmypage4 {
width : 30px;
height : 30px;
position: relative;
cursor: pointer;
}

.imgmypage3 {
margin: 0px auto;
}
.textmypage {
text-indent: 40px;
margin: auto 40px;
float: left;
}

</style>
<script>
function checkNumber(event) {
	  if(event.key >= 0 && event.key <= 9) {
	    return true;
	  }
	  return false;
}

function show() {
	
	document.updateinfo.submit();
}
</script>
</head>
<body>
<%
if(sid==null){
	%>
	<script>
		window.alert('로그인후 이용가능');
		location.href='/ezenstyle/member/memberLogin.jsp';
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
	<li><br><a href="/ezenstyle/member/memberOrderHistory.jsp" >구매 내역</a></li>
	<li><span><br><br><br><br><a href="memberDel.jsp" id="memberbye">[회원탈퇴]</a></span></li>
</ul>
</div>

<div id="box2"> 
<section>
	<article>
		<fieldset>
			<legend>&nbsp;&nbsp;  내 정보 보기  &nbsp;&nbsp; </legend>
			<table id="t123" >
			<%
				if(arr==null||arr.size()==0){
				%>
				<tr>
					<td>정보를 불러오기 실패</td>
				</tr>
				<% 
				}else{
					for(int i = 0 ; i < arr.size();i++){
						MemberDTO dto=arr.get(i);
						%>
						<tbody id="tbody111">
						<tr>
						<td class="tdmypage1"><span class="texta"><%=dto.getName()%></span> 님</td>
						<td class="tdnot"></td>
						<td class="tdmypage2">ID </td>
						<td class="tdmypage22"><%=dto.getId()%> </td>
						</tr>
						<tr class="trnot"></tr>
						<tr>
						<td colspan="4" class="tdmypage3"> 
						<img class="imgmypage" src="/ezenstyle/img/number.png">
						<img class="imgmypage" src="/ezenstyle/img/adr.png">
						<img class="imgmypage" src="/ezenstyle/img/email.png">
						<img class="imgmypage" src="/ezenstyle/img/pwd.png">
						 </td>
						</tr>
						<tr >
						<td colspan="4" class="tdmypage4"> 
						<span class="textmypage"><%=arr.get(i).getTel() %></span>
						<span class="textmypage"><%=arr.get(i).getAdr() %></span>
						<span class="textmypage"><%=arr.get(i).getEmail() %></span>
						<span class="textmypage"><%=arr.get(i).getPwd() %></span>
						</td>
						</tr>
						</tbody>
						<%
					}
				}
				%>
				
			</table>
		</fieldset>
	</article>
	
	<article id="art2">
		<fieldset>
		<legend>&nbsp;&nbsp;  상세 정보 수정  &nbsp;&nbsp; </legend>
		<form name="updateinfo" method="post">
		<ul>
			<li class="imgmypage3">
			 <input class="a" type="password" name="pwd"> <input class="btn1" type="submit" value="확인">
			  &nbsp;&nbsp;&nbsp;
			  <a class="imgmypage2" onclick="show()"></a> 	  
			 </li>
		</ul>
		</form>
		<form name="updateinfo2" action="memberMypage_ok.jsp" method="post">
		<table id="t124">
			<%if(dto1 == null){
				%>
				
				<%
			}else{
				%>
				<tr>
				<td><a class="texta">이름</a>  &nbsp;&nbsp;</td><td><input class="a" type="text" name="name" required="required" value="<%=dto1.getName() %>"> </td>
				</tr>
				<tr>
				<td><a class="texta">비밀번호</a>  &nbsp;&nbsp;</td><td><input class="a" type="text" name="pwd" required="required" value="<%=dto1.getPwd() %>"> </td>
				</tr>
				<tr>
				<td><a class="texta">주소</a>  &nbsp;&nbsp;</td><td><input class="a" type="text" name="adr" required="required" value="<%=dto1.getAdr() %>"> </td>
				</tr>
				<tr>
				<td><a class="texta">휴대전화</a>  &nbsp;&nbsp;</td><td><input class="a" type="text" name="tel" required="required" value="<%=dto1.getTel() %>" onkeypress="return checkNumber(event)"> </td>
				</tr>
				<tr>
				<td><a class="texta">이메일</a>  &nbsp;&nbsp;</td><td><input class="a" type="text" name="email" required="required" value="<%=dto1.getEmail() %>"> </td>
				</tr>
				<tr>
				<td><a class="texta">본인 확인 질문</a> &nbsp;&nbsp;</td>
				<td><select id="question" name="question" required="required">
			        <option value="가장 좋아하는 동물은?" <%if(dto1.getQuestion().equals("가장 좋아하는 동물은?")){%>selected="selected"<%} %>>가장 좋아하는 동물은?</option>
			        <option value="자신의 출신 초등학교는?" <%if(dto1.getQuestion().equals("자신의 출신 초등학교는?")){%>selected="selected"<%} %>>자신의 출신 초등학교는?</option>
			        <option value="가장 감명깊게 읽은 책의 제목은?" <%if(dto1.getQuestion().equals("가장 감명깊게 읽은 책의 제목은?")){%>selected="selected"<%} %>>가장 감명깊게 읽은 책의 제목은?</option>
			        <option value="자신의 반려동물 이름은?" <%if(dto1.getQuestion().equals("자신의 반려동물 이름은?")){%>selected="selected"<%} %>>자신의 반려동물 이름은?</option>
			        <option value="자신의 보물1호는?" <%if(dto1.getQuestion().equals("자신의 보물1호는?")){%>selected="selected"<%} %>>자신의 보물1호는?</option>
			         </select></td>
				</tr>
				<tr>
				<td><a class="texta">본인 확인 답변</a> &nbsp;&nbsp;</td>
				<td><input class="a" type="text" name="answer" required="required" value="<%=dto1.getAnswer() %>"></td>
				</tr>
				<tr>
				<td colspan="2" class="atd"> <input class="btn2" type="submit" value="수정"> </td>
				</tr>
				<%
			} 
			%>
		</table>
		</form>
		</fieldset>
	</article>
</section>

</div>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>