<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sname=(String)session.getAttribute("sname");
%>
<header>
	<h1>EZEN STYLE</h1>
	<%
   if(sname==null){
      %>
      <div><a>LOGIN</a>
      | <a>JOIN</a>
      | <a>MYPAGE</a>
      | <a>CART</a>
      </div>
      <%
   }else{
      %>
      <div><%=sname %>님 로그인중... 
      | <a>LOGOUT</a>
      | <a>MYPAGE</a>
      | <a>CART</a>
      </div>
      <%
   }
   %>
	<nav>
		<ul>
			<li>MAN</li>
			<li>WOMAN</li>
			<li>KID</li>
			<li>ACCESSORIES</li>
			<li>SHOES</li>
			<li><input type="text" name="search"><img src="img/search.png"></li>
		</ul>
	</nav>
	<hr>
</header>