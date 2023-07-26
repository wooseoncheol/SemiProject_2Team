<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/ezenstyle/css/semiLayout.css">
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
.btn2{
width:400px;
height:35px;
background-color:white;
border-style: solid;
border-top-color:#E7E7E7;
border-left-color:#E7E7E7;
border-bottom-color: #E7E7E7;
border-right-color: #E7E7E7;
border-radius: 7px;
}

.li3{}

</style>
</head>
<%
String id=request.getParameter("id");
%>
<body>
<%@ include file="/header.jsp" %>
<section>
	<article>
		<form name="pwdReset" action="pwdReset_ok.jsp" >
		<input type="hidden" name="id" value="<%=id %>">
		<div class="div1">
		<ul>
			<li><label>PASSWORD</label><br><br><input class="a" type="password" name="pwdre" ></li>
			<li><br><br><label>PASSWORD 확인</label><br><br><input class="a" type="password" name="pwdrecheck"></li>
			
			<li><br><br><input class="btn2" type="submit" value="CONFIRM" ></li>
			<li><br></li>
		</ul>
		</div>	
		</form>
	</article>
</section>
<%@ include file="/footer.jsp" %>
</body>
</html>