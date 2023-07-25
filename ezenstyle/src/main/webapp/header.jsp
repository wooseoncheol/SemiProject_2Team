<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sname=(String)session.getAttribute("sname");
%>
<script>
function search(){
	let userInput=document.searchForm.userInput.value;
	location.href='search.jsp?userInput='+userInput;
}
</script>
<header>
	<h1><a href="/ezenstyle/main.jsp">EZEN STYLE</a></h1>
	<%
   if(sname==null){
      %>
      <div><a href="/ezenstyle/member/memberLogin.jsp">LOGIN</a>
      | <a href="/ezenstyle/member/memberJoin.jsp">JOIN</a>
      | <a href="/ezenstyle/member/memberMypage.jsp">MYPAGE</a>
      | <a href="/ezenstyle/member/memberCart.jsp">CART</a>
      </div>
      <%
   }else{
      %>
      <div><%=sname %>님 로그인중... 
      | <a href="/ezenstyle/member/memberLogout.jsp">LOGOUT</a>
      | <a href="/ezenstyle/member/memberMypage.jsp">MYPAGE</a>
      | <a href="/ezenstyle/member/memberCart.jsp">CART</a>
      </div>
      <%
   }
   %>
	<nav>
	<form name="searchForm">
		<ul>
			<li>MAN</li>
			<li>WOMAN</li>
			<li>KID</li>
			<li>ACCESSORIES</li>
			<li>SHOES</li>
			<li><input type="text" name="userInput" ><img src="/ezenstyle/img/search.png" onclick="search()"></li><!-- 절대경로로 수정_유성진-->
		</ul>
	</form>
	</nav>
	<hr>
</header>