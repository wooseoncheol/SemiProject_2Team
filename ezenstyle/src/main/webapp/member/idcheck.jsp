<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mdto" class="com.ezenstyle.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.ezenstyle.member.MemberDAO"></jsp:useBean>

<%
String id = request.getParameter("id");
int count = -1;
String msg = " ";
count= mdao.memberDuplication(id);

if (id==null) {
	msg="";
	id="";
}else {
	switch(count){
	case 1: msg = "중복된 아이디입니다.";%><style>#idcktext{color:red;}</style><%break;
	case 0: msg = "사용가능한 아이디 입니다.";%><style>#idcktext{color:green;}</style><%break;
	case -1 : msg = " "; break;
	}

}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function show(){
	opener.document.memberjoin.id.value = '<%=id%>';
	window.self.close();
}
</script>
<style>
#idcp{
margin-left: 50px;
margin-top: 40px;
}
#idcth1{
font-size: 20px;
font-weight: bold;

}
#idcb{
width: 150px;
height: 20px;
border-style: solid;
border-top: 0px;
border-left: 0px;
border-right: 0px;
border-color: #898989;
}

.btn1{
margin-left:5px;
width:70px;
height:28px;
background-color: white;
border-style: solid;
border-top-color:#E7E7E7;
border-left-color:#E7E7E7;
border-bottom-color: #E7E7E7;
border-right-color: #E7E7E7;
border-radius: 5px;
}
.btn2{
margin-top:10px;
margin-left:15px;
width:230px;
height:28px;
background-color: white;
border-style: solid;
border-top-color:#E7E7E7;
border-left-color:#E7E7E7;
border-bottom-color: #E7E7E7;
border-right-color: #E7E7E7;
border-radius: 5px;
}

</style>
</head>
<body>
<div id="idcp">
<form name="id" method="post">
	<table>
		<tr>
		<td id="idcth1">아이디를 입력하세요</td>
		</tr>
		<tr>
		<td>ID : <input type="text" id="idcb" name="id" required="required" value="<%=id%>" Placeholder="사용할 id를 입력하세요">   
		<input class="btn1" type="submit" value="중복검사"></td>
		</tr>
		<tr>
		</tr>
		<tr><td><a id="idcktext"><%= msg %></a></td>
		</tr>
		<tr>
		<td><input type="button" class="btn2" value="사용하기" <%if(count == 0 && id != "" && id != null){%> onclick="show()" <% }else { } %>>
		</td>
		</tr>
		

	</table>
</form>
</div>

</body>
</html>