<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
article{
text-align: center;
}
li{
list-style-type:none;
}

hr{

width: 200px;}
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
<h1>로그인 페이지</h1>
<section>
	<article>
		<form name="login" action="memberLogin_ok.jsp" method="post">
		
		<ul>
			<li><label>USERID</label><br><input type="text" name="userid" value="<%= saveid%>"></li>
			<li><label>PASSWORD</label><br><input type="password" name="userpwd"></li>
			
			<li><br><input type="checkbox" name="saveid" value="on" <%=saveid.equals("")?"":"checked" %>>아이디 기억</li>
			<li><br><input type="submit" value="LOGIN" ></li>
			<li><br><hr></li>

			<li><br><input type="button" value="JOIN US" onclick="location.href='memberJoin.jsp'"></li>
		</ul>	
		</form>
	</article>
</section>

</body>
</html>