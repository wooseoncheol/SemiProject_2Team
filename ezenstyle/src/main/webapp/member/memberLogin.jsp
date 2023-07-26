<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/semiLayout.css">
<style>
.article1{
text-align: center;
}
.div1{
height:450px;
width:500px;
padding-top:50px;
margin: 0px auto;
}
li{
text-align:left;
list-style-type:none;
}
.a{
width:400px;
border-style: solid;
outline:none;
border-top: 0px;
border-left: 0px;
border-right: 0px;
border-bottom: ;
border-color: #898989;
font-size: 17px;
}
.btn1{
width:400px;
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

.li3{}

#search{
padding-left: 130px;
}
#search:hover {
	color: gray;
}

</style>
</head>
<%
String saveid="";
Cookie cks[]=request.getCookies();
if(cks!=null){
	for(int i = 0 ;i<cks.length;i++){
		if(cks[i].getName().equals("saveid")){
			saveid=cks[i].getValue();
		}
	}
}
%>
<body>
<%@include file="../header.jsp" %>
<section>
	<article class=art1>
		<form name="login" action="memberLogin_ok.jsp" method="post">
		<div class="div1">
		<ul>
			<li><label>USER ID</label><br><br><input class="a" type="text" name="userid" value="<%= saveid%>"></li>
			<li><br><br><label>PASSWORD</label><br><br><input class="a" type="password" name="userpwd"></li>
			
			<li class="li3"><br><input type="checkbox" name="saveid" value="on" <%=saveid.equals("")?"":"checked" %>>아이디 기억
			<a href="/ezenstyle/member/memberFind.jsp" id="search">아이디/비밀번호 찾기</a></li>
			<li><br><br><input class="btn1" type="submit" value="LOGIN" ></li>
			<li><br></li>

			<li><br><input class="btn1" type="button" value="JOIN US!" onclick="location.href='memberJoin.jsp'"></li>
		</ul>
		</div>	
		</form>
	</article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>