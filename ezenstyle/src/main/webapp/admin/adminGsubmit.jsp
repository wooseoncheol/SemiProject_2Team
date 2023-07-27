<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/ezenstyle/css/semiLayout.css">
<style>
form table{
width: 300px;
height: 300px;
margin: 0px auto;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<form name="goodsUpload" action="adminGsubmit_ok.jsp" method="post" enctype="multipart/form-data">

	<table border="1">
	<tr>
		<td rowspan="7">
		<input type="file" name="upload"></td>
		<td>카테고리 : <select name="g_category">
		<option value="man">MAN</option>
		<option value="woman">WOMAN</option>
		<option value="kid">KID</option>
		<option value="accessories">ACCESSORIES</option>
		<option value="shoes">SHOES</option>
		</select></td>
	</tr>
	<tr>
	<td>상품 이름 : <input type="text" name="g_name"></td>
	</tr>
	<tr>
	<td>가격 : <input type="number" name="g_price"></td>
	</tr>
	<tr>
	<td>색상 : <input type="text" name="g_color"></td>
	</tr>
	<tr>
	<td>사이즈 : <input type="text" name="g_size"></td>
	</tr>
	<tr>
	<td>재고 : <input type="number" name="g_stock"></td>
	</tr>
	<tr>
	<td>상세정보 : <textarea rows="10" cols="55" name="g_detail"></textarea></td>
	</tr>
	<tr>
	<td colspan="2">
	<input type="submit" value="올리기">
	</td>
	</tr>
	</table>

</form>

	
<%@include file="/footer.jsp" %>
</body>
</html>