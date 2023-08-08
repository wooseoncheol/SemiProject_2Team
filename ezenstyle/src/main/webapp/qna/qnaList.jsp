<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ezenstyle.qna.*" %>
<jsp:useBean id="qdao" class="com.ezenstyle.qna.QnaDAO"></jsp:useBean>
<jsp:useBean id="ndao" class="com.ezenstyle.notice.NoticeDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/ezenstyle/css/semiLayout.css">
<style>
table {
margin-right: auto;
margin-left: auto;
margin-top: 100px;
margin-bottom: 100px;
width: 900px;
border-collapse: collapse;

}

table thead {
height:50px;
}

table thead th {
border-top: 3px solid #C0C0C0;
border-bottom: 3px solid #9DB2BF;
text-align: center;
}

.q{
height: 45px;
}

table tbody td {
border-bottom: 3px solid #F0F0F0;
text-align: center;
}

table tfoot {
border-top: 3px solid #C0C0C0;
height: 50px;
}

.a{
text-indent: 150px;
text-align: left;

}
.b {
width: 100px;
}
.bb {
padding-top: 50px;
margin-top: 50px;
margin-left: 80px;
}
.btn2{
width:90px;
height:30px;
background-color:white;
border-style: solid;
border-top-color:#BDBDBD;
border-left-color:#BDBDBD;
border-bottom-color: #BDBDBD;
border-right-color: #BDBDBD;
border-radius: 7px;
cursor: pointer;
}
</style>
<script>
function pwdCheck(aaa){
	var pwd=aaa;
	window.open('qnaCheck.jsp?idx='+aaa,'popup','width=500,height=220,top=400,left=400');
}

</script>
</head>
<%
String id=(String)session.getAttribute("sid");
if(id==null){
	%>
	<script>
	window.alert('로그인 후 이용 가능하십니다.');
	location.href='/ezenstyle/member/memberLogin.jsp';
	</script>
	<%
	return;
}
%>
<%
int totalCnt=qdao.getTotalCnt();
int listSize=10;
int pageSize=5;

String cp_s=request.getParameter("cp");
if (cp_s==null||cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);

int totalPage=totalCnt/listSize+1;
if(totalCnt%listSize==0) {totalPage--;}

int userGroup=cp/pageSize;
if(cp%pageSize==0) {userGroup--;}
%>
<body>
<%@ include file="/header.jsp" %>
<section>
	<article>
		<h3 class="bb">1:1 문의게시판</h3>
		<form>
			<table>
				<thead>
					<tr>
						<th>TYPE</th>
						<th style="text-align: left">ID</th>
						<th class="a">SUBJECT</th>
						<th>DATE</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td colspan="4" align="center">
<%
if (userGroup!=0) {
	%><a href="qnaList.jsp?cp=<%=(userGroup-1)%pageSize+pageSize%>">&lt;&lt;</a><%
}
%>
<%
for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++) {
	%>&nbsp;&nbsp;<a href="qnaList.jsp?cp=<%=i %>"><%=i %></a>&nbsp;&nbsp;<%
	if (i==totalPage) {
		break;
	}
 }
%>
<%
if (userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))) {
	%><a href="qnaList.jsp?cp=<%=(userGroup+1)*pageSize+1 %>">&gt;&gt;</a><%
}
%>
						</td>
					</tr>
					<tr>
					<td colspan="4" align="right">
						<input type="button" value="글쓰기" onclick="location.href='qnaWrite.jsp'" class="btn2">
						</td>
					</tr>
				</tfoot>
				<tbody>
				<%
					ArrayList<QnaDTO> arr=qdao.qnaMgrList(cp, listSize);
					if (arr==null||arr.size()==0) {
						%>
						<tr>
							<td colspan="4" align="center">등록된 게시글이 없습니다.</td>
						</tr>
						<%
					} else {
						for (int i=0;i<arr.size();i++){
							%>
							<tr class="q">
								<td class="b"><%=arr.get(i).getIdx()%></td>
								<td  style="text-align: left"><%=arr.get(i).getId() %></td>
								<td class="a">
								<% 
								for (int z=0;z<arr.get(i).getLev();z++){
									out.println("&nbsp;&nbsp;");
								}
								%>
								<a href="javascript:pwdCheck(<%=arr.get(i).getIdx()%>)"><%=arr.get(i).getSubject() %></a></td>	
								<td><%=arr.get(i).getWritedate() %></td>
							</tr>
						<%
						}
						
					}
					%>
					</tbody>	
			</table>
		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>