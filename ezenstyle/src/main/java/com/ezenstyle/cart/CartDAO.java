package com.ezenstyle.cart;

import java.sql.*;

public class CartDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public CartDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public int cartInsert(CartDTO dto) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="insert into semi_cart values(?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setInt(2, dto.getG_idx());
			ps.setString(3, dto.getG_name());
			ps.setInt(4, dto.getG_price());
			ps.setInt(5, dto.getOrdernum());
			int count=ps.executeUpdate();
			return count;	
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
}
