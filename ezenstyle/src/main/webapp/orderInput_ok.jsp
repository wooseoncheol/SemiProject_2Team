<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezenstyle.goods.*" %>
<%@ page import="com.ezenstyle.order.*" %>
<%@ page import="com.ezenstyle.cart.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="cdao" class="com.ezenstyle.cart.CartDAO"></jsp:useBean>    
<jsp:useBean id="odao" class="com.ezenstyle.order.OrderDAO"></jsp:useBean>

<%
request.setCharacterEncoding("utf-8");

String sid=(String)session.getAttribute("sid");

String name=request.getParameter("name");
String addr=request.getParameter("addr");
String tel=request.getParameter("tel");

ArrayList<CartDTO> arr=cdao.showCart(sid);

int sum=0;
int count=0;
String msg="";

for(int i=0;i<arr.size();i++){
	
	String g_nfile=arr.get(i).getG_nfile();
	String g_name=arr.get(i).getG_name();
	int g_price=arr.get(i).getG_price();
	String g_size=arr.get(i).getG_size();
	int ordernum=arr.get(i).getOrdernum();
	String g_category=arr.get(i).getG_category();
	String o_state="결제 완료";
	
	OrderDTO dto=new OrderDTO(sid,name,addr,tel,g_nfile,g_name,g_price,g_size,ordernum,g_category,o_state);
	
	int result=odao.insertOrder(dto);
	
	if(result>0){
		count=odao.deleteCart(arr.get(i).getC_idx());
		sum=sum+count;
	}else{
		sum--;
	}
}
if(sum==arr.size()){
	//int count=odao.deleteCart(sid);
	msg=count>0?"결제가 완료되었습니다":"결제가 실패하였습니다";
}else{
	msg="결제가 등록 실패. 고객센터 문의바랍니다!";
}


%>
<script>
	window.alert('<%=msg%>');
	location.href='/ezenstyle/member/memberMypage.jsp';
</script>