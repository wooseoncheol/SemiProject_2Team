package com.ezenstyle.cart;

import java.sql.*;
import java.util.*;

public class CartDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public CartDAO() {
		// TODO Auto-generated constructor stub
	}
	
	//장바구니에 넣은 상품들 조회 메서드
	public ArrayList<CartDTO> showCart(String id){
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			ArrayList<CartDTO> arr=new ArrayList<CartDTO>();
			String sql="select * from semi_cart where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				id=rs.getString("id");
				String g_idx=rs.getString("g_idx");
				String g_nfile=rs.getString("g_nfile");
				String g_category=rs.getString("g_category");
				String g_name=rs.getString("g_name");
				int g_price=rs.getInt("g_price");
				String g_size=rs.getString("g_size");
				int ordernum=rs.getInt("ordernum");
				
				CartDTO dto=new CartDTO(g_idx, ordernum, g_nfile, g_category, g_name, g_price, g_size, ordernum);
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
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
}
