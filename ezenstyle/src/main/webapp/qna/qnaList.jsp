<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ezenstyle.qna.*" %>
<jsp:useBean id="qdao" class="com.ezenstyle.qna.QnaDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/ezenstyle/css/semiLayout.css">
<style>
table {
margin: 0px auto;
height: auto;
min-height: 100px;
width: 700px;
border-collapse: collapse;
}
table thead th {
border-bottom: 1px solid gray;
}
table td {
text-align: center;
}
a {
text-decoration: none;
}
.a{
text-align: left;
padding-left: 200px;
}
</style>
</head>
<%
String sid=(String)session.getAttribute("sid");
if(sid==null){
	%>
	<script>
	window.alert('로그인 후 이용 가능하십니다.');
	location.href='/ezenstyle/main.jsp';
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
		<h3>1대1 문의게시판</h3>
		<form>
			<table>
				<thead>
					<tr>
						<th>TYPE</th>
						<th>SUBJECT</th>
						<th>DATE</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td colspan="2" align="center">
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
						<td align="center">
						<a href="qnaWrite.jsp">	글쓰기</a>
						</td>
					</tr>
				</tfoot>
				<tbody>
				<%
				ArrayList<QnaDTO> arr=qdao.qnaList(cp, listSize);
				if (arr==null||arr.size()==0) {
					%>
					<tr>
						<td colspan="3" align="center">등록된 게시글이 없습니다.</td>
					</tr>
					<%
				} else {
					for (int i=0;i<arr.size();i++){
						%>
						<tr>
							<td><%=arr.get(i).getIdx()%></td>
							<td class="a">
							<% 
							for (int z=0;z<arr.get(i).getLev();z++){
								out.println("&nbsp;&nbsp;");
							}
							%>
							<a href="qnaContent.jsp?idx=<%=arr.get(i).getIdx()%>"><%=arr.get(i).getSubject() %></a></td>	
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