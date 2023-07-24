<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	case 1: msg = "중복된 아이디입니다.";break;
	case 0: msg = "사용가능한 아이디 입니다.";break;
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
</head>
<body>
<div>
<form name="id">
<fieldset>
	<legend>아이디 중복 검사</legend>
	<table>
		<tr>
		<td>아이디를 입력하세요</td>
		</tr>
		<tr>
		<td>ID : <input type="text" name="id" required="required" value="<%=id%>">   <input type="submit" value="중복검사"></td>
		</tr>
		<tr>
		</tr>
		<tr><td><%= msg %></td>
		</tr>
		<tr>
		<td><input type="button" value="사용하기" <%if(count == 0 && id != "" && id != null){%> onclick="show()" <% }else { } %>>
		</td>
		</tr>
		

	</table>
</fieldset>
</form>
</div>

</body>
</html>