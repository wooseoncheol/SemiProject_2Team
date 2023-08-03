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
.navigation {
 padding-bottom: 70px;
}
a {
    outline: 0;
    text-decoration: none;
}
.menu__item {
  	margin-left:30px;
  	margin-right:0px;
    white-space: nowrap;
}
@media screen and (max-width: 100px) {
    .menu__item:nth-child(n + 3) {
        display: none;
    }
    .menu__item:nth-child(2) .menu__link {
        border-right: 0;
    }
}
@media screen and (max-width: 200px) {
    .menu__item:nth-child(n + 4) {
        display: none;
    }
    .menu__item:nth-child(3) .menu__link {
        border-right: 0;
    }
}
@media screen and (max-width: 300px) {
    .menu__item:nth-child(n + 5) {
        display: none;
    }
    .menu__item:nth-child(4) .menu__link {
        border-right: 0;
    }
}
.menu__item:last-child .menu__link {
    border-right: 0;
}
.menu__link {
    display: block;
    padding: 2px 10px 1px;
    border-right: 2px dotted #ccd7d7;
}
.menu__link:hover .menu__first-word, .menu__link:focus .menu__first-word {
    transform: translate3d(0, -105%, 0);
}
.menu__link:hover .menu__second-word, .menu__link:focus .menu__second-word {
    transform: translate3d(0, 105%, 0);
}
@media screen and (min-width: 768px) {
    .menu__link {
        padding: 2px 10px 1px;
    }
}
.menu__title {
    display: inline-block;
    overflow: hidden;
}
.menu__first-word, .menu__second-word {
    display: inline-block;
    position: relative;
    transition: transform .3s;
}
.menu__first-word::before, .menu__second-word::before {
    position: absolute;
    content: attr(data-hover);
}
.menu__first-word {
	font-weight: bold;
    color: #5D5D5D;
}
.menu__first-word::before {
	font-weight: bold;
    top: 105%;
    color: #BDBDBD;
}
.menu__second-word {
	font-weight: bold;
    color: #BDBDBD;
}
.menu__second-word::before {
	font-weight: bold;
    bottom: 105%;
    color: #5D5D5D;
}
.v {
display: none;
}
.vb {
margin-left: 50px;
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
	<nav class="navigation">
	<img src="/ezenstyle/img/logo.png"  id="logo" onclick="javascript:location.href='/ezenstyle/main.jsp'" style="cursor:pointer;">
	<form name="searchForm" action="/ezenstyle/search.jsp">
		<ul class="menu">
		
			 <li class="menu__item">
      			<a href="/ezenstyle/goods/goodsList.jsp?category=man" class="menu__link">
        			<span class="menu__title">
          			<span class="menu__first-word" data-hover="MAN">
           				MAN
          			</span>
          			<span class="menu__second-word" data-hover="남성">
           				남성
          			</span>
        			</span>
      			</a>
    		</li>
			
			 <li class="menu__item">
      			<a href="/ezenstyle/goods/goodsList.jsp?category=woman" class="menu__link">
        			<span class="menu__title">
          			<span class="menu__first-word" data-hover="WOMAN">
           				WOMAN
          			</span>
          			<span class="menu__second-word" data-hover="여성">
           				여성
          			</span>
        			</span>
      			</a>
    		</li>
					
			<li class="menu__item">
      			<a href="/ezenstyle/goods/goodsList.jsp?category=kid" class="menu__link">
        			<span class="menu__title">
          			<span class="menu__first-word" data-hover="KID">
           				KID
          			</span>
          			<span class="menu__second-word" data-hover="아동">
           				아동
          			</span>
        			</span>
      			</a>
    		</li>
			
			<li class="menu__item">
      			<a href="/ezenstyle/goods/goodsList.jsp?category=accessories" class="menu__link">
        			<span class="menu__title">
          			<span class="menu__first-word" data-hover="ACCESSORIES">
           				ACCESSORIES
          			</span>
          			<span class="menu__second-word" data-hover="악세서리">
           				악세서리
          			</span>
        			</span>
      			</a>
    		</li>
			
		<li class="menu__item">
      			<a href="/ezenstyle/goods/goodsList.jsp?category=shoes" class="menu__link">
        			<span class="menu__title">
          			<span class="menu__first-word" data-hover="SHOES">
           				SHOES
          			</span>
          			<span class="menu__second-word" data-hover="신발">
           				신발
          			</span>
        			</span>
      			</a>
    		</li>
			
			<li class="vb"><input type="text" name="userInput" size=15><img src="/ezenstyle/img/search.png" class="search" onclick="search()" style="cursor:pointer;"></li><!-- 절대경로로 수정_유성진-->
			<input class="v" type="submit" value=" ">
		</ul>
	</form>
	</nav>	
	<hr>
</header>