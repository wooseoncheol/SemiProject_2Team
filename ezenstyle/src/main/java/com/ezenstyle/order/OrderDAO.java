package com.ezenstyle.order;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;

public class OrderDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public OrderDAO() {
		System.out.println("OrderDAO 호출");
	}
	
	/**구매 테이블에 데이터 삽입 관련 메소드 김시연*/
	public int insertOrder(OrderDTO dto) {
		try {
			
			conn=com.ezenstyle.db.EzenDB.getConn();
			
			String sql="insert into semi_order values(semi_order_o_idx.nextval,?,?,?,?,?,?,?,?,?,?,sysdate,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getAdr());
			ps.setString(4, dto.getTel());
			ps.setString(5, dto.getG_nfile());
			ps.setString(6, dto.getG_name());
			ps.setInt(7, dto.getG_price());
			ps.setString(8, dto.getG_size());
			ps.setInt(9, dto.getOrdernum());
			ps.setString(10, dto.getG_category());
			ps.setString(11, dto.getO_state());
			int count=ps.executeUpdate();
			
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	/**구매완료 된 후 장바구니 테이블에 담김 데이터 삭제 김시연*/
	public int deleteCart(int c_idx) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			
			String sql="delete from semi_cart where c_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, c_idx);
			int count=ps.executeUpdate();
			
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	/**고객 배송 관리_재영*/
	public ArrayList<OrderDTO> adminOrder() {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="select * from (select adr, g_name, name, o_idx, orderdate, to_char(orderdate,'yyyymmddhh24miss') as \"orderdate1\", o_state, row_number()over(partition by orderdate order by orderdate desc) as \"rn\" from semi_order) a, (select orderdate, count(orderdate) as \"max\", trunc((sysdate-orderdate)) as \"del_state\" from semi_order group by orderdate) b where a.orderdate=b.orderdate";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			System.out.println("성공1");
			ArrayList<OrderDTO> arr=new ArrayList<OrderDTO>();
			System.out.println("성공2");
			while(rs.next()) {	
				int max=rs.getInt("max");
				int o_idx=rs.getInt("o_idx");
				String name=rs.getString("name");
				String adr=rs.getString("adr"); 
				String g_name=rs.getString("g_name");
				java.sql.Date orderdate=rs.getDate("orderdate");
				String orderdate1=rs.getString("orderdate1");
				String o_state=rs.getString("o_state");
				int del_state=rs.getInt("del_state");
				int rn=rs.getInt("rn");
				
				OrderDTO dto=new OrderDTO(orderdate, rn, max, o_idx, name, adr, g_name, orderdate1, o_state, del_state);
				arr.add(dto);
				}
				return arr;
		} catch (Exception e) {
				e.printStackTrace();
				return null;
		} finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
			
		}
	}
	
	/** 구매 내역 리스트 유성진*/
	public ArrayList<OrderDTO> orderList(String id){
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql = "select * from (select o_idx, id ,name, adr, tel, g_nfile, g_name, g_price, g_size, ordernum, orderdate ,TO_CHAR(orderdate,'YYYY_MM_dd_HH24:MI:SS') as \"orderdate1\",g_category, o_state, row_number()over(partition by orderdate order by orderdate desc) as \"rn\" from semi_order) a, (select orderdate, count(orderdate) as \"max\", trunc((sysdate-orderdate)) as \"del_state\" from semi_order group by orderdate) b where a.orderdate=b.orderdate and id = ?";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			ps=conn.prepareStatement(sql);
			ps.setString(1,id);
			rs=ps.executeQuery();
			ArrayList<OrderDTO> arr=new ArrayList<OrderDTO>();
			
			while(rs.next()) {
				int o_idx=rs.getInt("o_idx");
				String name=rs.getString("name");
				String adr=rs.getString("adr");
				String tel = rs.getString("tel");
				String g_nfile = rs.getString("g_nfile");
				String g_name = rs.getString("g_name");
				int g_price = rs.getInt("g_price");
				String g_size = rs.getString("g_size");
				int ordernum = rs.getInt("ordernum");
				String g_category = rs.getString("g_category");
				java.sql.Date orderdate2 = rs.getDate("orderdate");
				String orderdate1 = sdf.format(orderdate2);
				String detailorderdate=rs.getString("orderdate1");
				String o_state=rs.getString("o_state");
				int max=rs.getInt("max");
				int del_state=rs.getInt("del_state");
				int rn=rs.getInt("rn");
				OrderDTO dto=new OrderDTO(o_idx, id, name, adr, tel, g_nfile, g_name, g_price, g_size, ordernum, g_category, orderdate1, detailorderdate, o_state, del_state, max, rn);
				arr.add(dto);
			}
			return arr;
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e1) {
				
			}
		}
	}
	/** 구매 내역 상세 리스트 유성진*/
	public ArrayList<OrderDTO> orderDetailList(String id, String detailorderdate){
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql = "select * from semi_order where orderdate = to_date(?, 'YYYY_MM_dd_HH24:MI:SS') and id = ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, detailorderdate);
			ps.setString(2, id);
			rs=ps.executeQuery();
			ArrayList<OrderDTO> arr=new ArrayList<OrderDTO>();
			while(rs.next()) {
				int o_idx=rs.getInt("o_idx");
				String name=rs.getString("name");
				String adr=rs.getString("adr");
				String tel = rs.getString("tel");
				String g_nfile = rs.getString("g_nfile");
				String g_name = rs.getString("g_name");
				int g_price = rs.getInt("g_price");
				String g_size = rs.getString("g_size");
				int ordernum = rs.getInt("ordernum");
				String g_category = rs.getString("g_category");
				java.sql.Date orderdate2 = rs.getDate("orderdate");
				String o_state=rs.getString("o_state");
				OrderDTO dto=new OrderDTO(o_idx, id, name, adr, tel, g_nfile, g_name, g_price, g_size, ordernum, g_category, orderdate2, o_state);
				arr.add(dto);
			}
			return arr;
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e1) {
				e1.printStackTrace();
			}
		}
	}
	/** 구매 내역 상세 리스트 - 주문취소 요청 유성진*/
	public int orderDetailListCancel(String id, String detailorderdate){
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql = "update semi_order set o_state = '결제 취소 요청'  where orderdate = to_date(?, 'YYYY_MM_dd_HH24:MI:SS') and id = ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, detailorderdate);
			ps.setString(2, id);
			int count=ps.executeUpdate();
			
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e1) {
				e1.printStackTrace();
			}
		}
	}
	
	
	/**고객 배송 결제 취소_재영*/
	public int adminCancel(String orderdate1) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="delete from semi_order where orderdate=to_date(?,'yyyymmddhh24miss')";
			ps=conn.prepareStatement(sql);
			ps.setString(1, orderdate1);
			int count=ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) { }
			
		}
		
	}
		
	

}
