<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
width: 700px;
border-collapse: collapse;
}
.g {
height: 40px;
text-align:center;
border-bottom: 3px solid #F0F0F0;
border-top: 3px solid #F0F0F0;
}
.gg{
height: 200px;
text-align:center;
border-bottom: 3px solid #F0F0F0;
border-top: 3px solid #F0F0F0;
}
.u {
height: 40px;
border-bottom: 3px solid #F0F0F0;
border-top: 3px solid #F0F0F0;
text-indent: 30px;
}
.uu {
height: 40px;
border-bottom: 3px solid #F0F0F0;
border-top: 3px solid #F0F0F0;
}
.uuu{
text-indent: 30px;
}
input[type=text] {
border-top: none;
border-left: none;
border-right: none;
border-bottom: 2px solid #BDBDBD;
outline: none;
}
input[type=number] {
border-top: none;
border-left: none;
border-right: none;
border-bottom: 2px solid #BDBDBD;
outline: none;
}
select {
border-radius: 15px;
border: 2px solid #BDBDBD;
padding: .2em .3em;
}
textarea {
border-radius: 5px;
border: 2px solid #BDBDBD;
padding: .2em .3em;
resize: none;
}
input[type=file]::file-selector-button {
  width: 100px;
  height: 30px;
  background: #fff;
  border: 2px solid #BDBDBD;
  border-radius: 10px;
  cursor: pointer;
}
input[type="submit"]{
width:100px;
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
</head>
<body>
<%@include file="/header.jsp" %>
<form name="goodsUpload" action="adminGsubmit_ok.jsp" method="post" enctype="multipart/form-data">

	<table>
	<tr class="uu">
		<td rowspan="7" class="filebox">
    	<input type="file" name="upload"></td>
		<td class="uuu">카테고리</td>
		<td class="uuu">
		<select name="g_category">
		<option value="man">MAN</option>
		<option value="woman">WOMAN</option>
		<option value="kid">KID</option>
		<option value="accessories">ACCESSORIES</option>
		<option value="shoes">SHOES</option>
		</select></td>
	</tr>
	<tr class="u">
	<td>상품 이름</td>
	<td><input type="text" name="g_name"></td>
	</tr>
	<tr class="u">
	<td>가격</td>
	<td><input type="number" name="g_price"></td>
	</tr>
	<tr class="u">
	<td>색상</td>
	<td><input type="text" name="g_color"></td>
	</tr>
	<tr class="u">
	<td>사이즈</td>
	<td><input type="text" name="g_size"></td>
	</tr>
	<tr class="u">
	<td>재고</td>
	<td><input type="number" name="g_stock"></td>
	</tr>
	<tr class="gg">
	<td colspan="2"><textarea rows="10" cols="55" name="g_detail" placeholder="상세정보"></textarea></td>
	</tr>
	<tr class="g">
	<td colspan="3">
	<input class="m" type="submit" value="올리기">
	</td>
	</tr>
	</table>

</form>

	
<%@include file="/footer.jsp" %>
</body>
</html>