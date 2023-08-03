<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.ezenstyle.goods.*" %>
<%
String sname=(String)session.getAttribute("sname");
%>
<script>
function search(){
	let userInput=document.searchForm.userInput.value;
	location.href='/ezenstyle/search.jsp?userInput='+userInput;
}
</script>
<style>
.v {
display: none;
}
a{
text-decoration-line: none;
color:black;
}
header a:hover{
font-weight: bold;
}

</style>
<header>
	<%
   if(sname==null){
      %>
      <div><a href="/ezenstyle/member/memberLogin.jsp">LOGIN</a>
      | <a href="/ezenstyle/member/memberJoin.jsp">JOIN</a>
      | <a href="/ezenstyle/member/memberMypage.jsp">MYPAGE</a>
      | <a href="/ezenstyle/member/memberCart.jsp">CART</a>
      </div>
      <%
   }
   else{
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
	<img src="/ezenstyle/img/logo.png"  id="logo" onclick="javascript:location.href='/ezenstyle/main.jsp'" style="cursor:pointer;">
	<form name="searchForm" action="/ezenstyle/search.jsp">
		<ul>
			<li><a href= "/ezenstyle/goods/goodsList.jsp?category=man"><span color>M</span>AN</a></li>
			<li><a href= "/ezenstyle/goods/goodsList.jsp?category=woman">WOMAN</a></li>
			<li><a href= "/ezenstyle/goods/goodsList.jsp?category=kid">KID</a></li>
			<li><a href= "/ezenstyle/goods/goodsList.jsp?category=accessories">ACCESSORIES</a></li>
			<li><a href= "/ezenstyle/goods/goodsList.jsp?category=shoes">SHOES</a></li>
			<li id = la><input type="text" name="userInput" ><img src="/ezenstyle/img/search.png" class="search" onclick="search()" style="cursor:pointer;"></li><!-- 절대경로로 수정_유성진-->
			<input class="v" type="submit" value=" ">
		</ul>
	</form>
	</nav>
	<hr>
</header>