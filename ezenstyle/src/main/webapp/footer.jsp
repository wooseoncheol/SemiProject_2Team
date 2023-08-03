<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao2" class="com.ezenstyle.member.MemberDAO"></jsp:useBean>
<style>
a {
text-decoration:none;
}
.p {
height: 30px;
width: 30px;
filter: grayscale(100%);
margin:0px auto;
}
.r {
height: 32px;
width: 32px;
filter: grayscale(100%);
margin:0px auto;
}
</style>
<footer>
	<hr>
	<div>
	<h3>EZEN STYLE<br>.COM</h3>
	<div>
	<a href="https://www.ezenac.co.kr/">
	<img class="p" src="/ezenstyle/img/ezenlogo.png">
	</a>
	</div>
	<div>
	<a href="https://www.instagram.com/ezen_ac_official/">
	<img class="r" src="/ezenstyle/img/instagram.png">
	</a>
	</div>
	<div>
	<a href="https://www.facebook.com/ezenac.co.kr/">
	<img class="p" src="/ezenstyle/img/facebook.png">
	</a>
	</div>
	<p><br>주식회사 이젠아카데미 대표이사: 홍길동 외 5인 서울시 신촌지점<br>
	사업자등록번호: 214-547-254879 [사업자정보확인]<br>
	서울 마포구-08797 / 개인정보관리 및 청소년 보호 책임자 : 회원운영관리담당 홍길동 / 홈페이지<br>
	고개님의 안전거래를 위해 현금결제시 이젠은행과 채무지급보증계약을 체결하여 안전거래를 보장하고 있습니다.<br>
	<br>
	최고의 서비스를 제공하기 위해 쿠키를 사용합니다.</p>
	<a href="/ezenstyle/qna/qnaList.jsp">1:1문의사항</a>
	<a href="/ezenstyle/notice/noticeList.jsp">공지사항</a>
	<% 
		String adminid=(String)session.getAttribute("sid");
		if (adminid==null||adminid.equals("")) {
			adminid="";
		} else {
			int result2=mdao2.adminPage(adminid);
			if (result2>0) {
				%>
				<a href="/ezenstyle/admin/adminMain.jsp"> 관리자 페이지</a>
				<%
			} else {
				System.out.println("not admin");
			}
		}
	%>
	</div>
</footer>