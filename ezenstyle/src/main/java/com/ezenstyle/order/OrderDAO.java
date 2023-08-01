package com.ezenstyle.order;

import java.sql.*;
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
			String sql="select * from (select adr, g_name, name, o_idx, orderdate, o_state, row_number()over(partition by orderdate order by orderdate desc) as \"rn\" from semi_order) a, (select orderdate, count(orderdate) as \"max\", trunc((sysdate-orderdate)) as \"del_state\" from semi_order group by orderdate) b where a.orderdate=b.orderdate";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			System.out.println("성공");
			ArrayList<OrderDTO> arr=new ArrayList<OrderDTO>();
			while(rs.next()) {	
				System.out.println("성공2");	
				int max=rs.getInt("max");
				int o_idx=rs.getInt("o_idx");
				String name=rs.getString("name");
				String adr=rs.getString("adr"); 
				String g_name=rs.getString("g_name");
				java.sql.Date orderdate=rs.getDate("orderdate");
				String o_state=rs.getString("o_state");
				int del_state=rs.getInt("del_state");
				int rn=rs.getInt("rn");
				
				OrderDTO dto=new OrderDTO(rn, max, o_idx, name, adr, g_name, orderdate, o_state, del_state);
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

}
