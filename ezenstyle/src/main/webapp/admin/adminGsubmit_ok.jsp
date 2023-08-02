<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.ezenstyle.goods.*" %>

<jsp:useBean id="gdao" class="com.ezenstyle.goods.GoodsDAO" scope="session"></jsp:useBean>

<%
	request.setCharacterEncoding("utf-8");
	String savepath=request.getRealPath("/goods/imgs");
	int filesize = 15728640;//10mb, 15728640 15mb
	MultipartRequest mr = new MultipartRequest(request, savepath, filesize,"utf-8",new DefaultFileRenamePolicy());
	
	String g_name = mr.getParameter("g_name");
	String g_color = mr.getParameter("g_color");
	String g_size = mr.getParameter("g_size");
	String g_stock_s = mr.getParameter("g_stock");
	int g_stock = Integer.parseInt(g_stock_s);
	
	String g_price_s = mr.getParameter("g_price");
	int g_price = Integer.parseInt(g_price_s);
	String g_category = mr.getParameter("g_category");
	String g_detail = mr.getParameter("g_detail");
	if(g_detail==null||g_detail.equals("")){g_detail = " ";}										
	String g_ofile=mr.getOriginalFileName("upload");
	String g_nfile=mr.getFilesystemName("upload");

	
	GoodsDTO dto = new GoodsDTO(g_name, g_ofile, g_nfile, g_color, g_size, g_stock, g_price, g_category, g_detail);

	gdao.goodsInsert(dto);
	
%>

<script>
window.alert("이미지 업로드 완료");
location.href='/ezenstyle/admin/adminGsubmit.jsp';
window.self.close();
</script>







