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
	

}
