<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.goods.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<jsp:useBean id="idao" class="com.ezenstyle.goods.GoodsDAO" scope="session"></jsp:useBean>
<%String category_s = request.getParameter("category"); %>
<%String category = category_s.toUpperCase(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%	
	DecimalFormat df = new DecimalFormat("###,###,###");
	
	int totalCnt = idao.getTotalCnt(category_s);
	int listSize=6;
	int pageSize=5;
	
	String cp_s = request.getParameter("cp");
	if(cp_s==null || cp_s.equals("")){
		cp_s="1";
	}
	int cp = Integer.parseInt(cp_s);

	int totalpage=totalCnt/listSize+1;
	if(totalCnt % listSize == 0){totalpage--;}
	
	int userGroup = cp/pageSize;  
	if(cp%pageSize==0){
		userGroup--;
	}
	
	String lt_s=request.getParameter("listtype");
	int lt = 0 ;
	if(lt_s==null){
		lt = 0;
	}else{lt= Integer.parseInt(lt_s);}
	
%>
<style>
section	 img{
width: 250px;
height: 350px;
object-fit: cover;
}
section h3{
font-style: italic;
}
section li{
list-style-type:none;
width: 100px;
margin: center;
margin-top:20px;
}
section table{
margin: 0px auto;
height: 600px;
border-spacing: 50px 0px;
}
section td{
font-size: 15px;
border-bottom: 3px solid #F0F0F0;
}

#paging{
border-bottom: 0px;
font-weight: bold;
font-size:20px;
padding-bottom: 1px;
padding-top: 40px;
}
#paging a{
color: darkgray;
}


#ca{
margin-top: 3px;
color: gray;
font-size:12px;
}

#img {
background-color: skyblue;
width: 250px;
height: 350px;
}

.goodsname{
font-weight: bold;
font-size: 20px;
margin-top: 3px;
}
.goodsprice{
color: darkgray;
margin-top: 0px;
}

ul{ 
padding-inline-start: 10px;

}
section fieldset{
margin: 0px, auto;
}
select {
border-radius: 15px;
border: 2px solid #BDBDBD;
height: 30px;
width: 100px;
padding: .2em .3em;
}
</style>
<script>
function list(e, category){
	const value = e.value;
	location.href="/ezenstyle/goods/goodsList.jsp?listtype="+value+"&category="+category;
}
</script>
<link rel="stylesheet" type="text/css" href="../css/semiLayout.css">
</head>
<body>
<%@include file = "../header.jsp" %>
<section>
<h3><%=category%></h3>
<div class= "select" align = "right" >
<select onchange="list(this, '<%=request.getParameter("category")%>')">
	<option value="0" disabled <%if(lt==0){%>selected="selected"<%}%>>==정렬==</option>
	<option value="1"<%if(lt==1){%>selected="selected"<%}%>>가격높은순</option>
	<option value="2"<%if(lt==2){%>selected="selected"<%}%>>가격낮은순</option>
	<option value="3"<%if(lt==3){%>selected="selected"<%}%>>인기높은순</option>
	<option value="4"<%if(lt==4){%>selected="selected"<%}%>>인기낮은순</option>
</select>
</div>
<article>
<table>
	<tr>
	<%
	
	ArrayList<GoodsDTO> arr = idao.showGoodsList(category_s, cp, listSize, lt);
	for (int i = 0 ; i<arr.size(); i++){
		%>
		<td >
			<ul><a href = "goodsContent.jsp?idx=<%=arr.get(i).getIdx()%>">
			<li id = "img"><img src="/ezenstyle/goods/imgs/<%=arr.get(i).getG_nfile() %>"></li>
			<li id="ca"><b><%=arr.get(i).getG_category() %></b></li>
			<li class="goodsname"><%=arr.get(i).getG_name() %></li>
			<li class="goodsprice"><%=df.format(arr.get(i).getG_price() )%>원</li>
			</a></ul>
		</td>
		<%if((i+1)%3==0){
			%>
			</tr>
			<tr>
			<%
		}
	}
	%>
	</tr>
	<tr>
		<td colspan ="3" align = "center" id="paging">
			<%
		if(userGroup!=0){
			%> <a href="goodsList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize %>&category=<%=category_s%>">&lt;&lt;</a> <%
		}
		%>
		<%
		for(int i = userGroup*pageSize+1 ; i<=userGroup*pageSize+pageSize; i++){
			%>&nbsp;&nbsp;<a href="goodsList.jsp?cp=<%= i%>&category=<%=category_s%>"><%=i%></a>&nbsp;&nbsp;<%
			if(i==totalpage){
				break;
			}
		}
		%>
		<%
		if(userGroup!=(totalpage/pageSize-(totalpage%pageSize==0?1:0))){
			%> <a href="goodsList.jsp?cp=<%=(userGroup+1)*pageSize+1 %>&category=<%=category_s%>">&gt;&gt;</a> <%
		}
		%>
		</td>
	</tr>
</table>
</article>
</section>
<%@include file = "../footer.jsp" %>
</body>
</html>