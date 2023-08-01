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
	
	/**장바구니에서 주문 수정할 때 정보 출력 메소드*/
	public CartDTO showCartOne(int c_idx) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			
			String sql="select * from semi_cart where c_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, c_idx);
			rs=ps.executeQuery();
			CartDTO dto=null;
			if(rs.next()) {
				String id=rs.getString("id");
				int g_idx=rs.getInt("g_idx");
				String g_nfile=rs.getString("g_nfile");
				String g_category=rs.getString("g_category");
				String g_name=rs.getString("g_name");
				int g_price=rs.getInt("g_price");
				String g_size=rs.getString("g_size");
				int ordernum=rs.getInt("ordernum");
				
				dto=new CartDTO(c_idx, id, g_idx, g_nfile, g_category, g_name, g_price, g_size, ordernum);
			}
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
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
				int c_idx=rs.getInt("c_idx");
				id=rs.getString("id");
				int g_idx=rs.getInt("g_idx");
				String g_nfile=rs.getString("g_nfile");
				String g_category=rs.getString("g_category");
				String g_name=rs.getString("g_name");
				int g_price=rs.getInt("g_price");
				String g_size=rs.getString("g_size");
				int ordernum=rs.getInt("ordernum");
				
				CartDTO dto=new CartDTO(c_idx, id, g_idx, g_nfile, g_name, g_category, g_price, g_size, ordernum);
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
	
	//상품 테이블에서 수량 변경
	public int updateStock(int ordernum,int g_idx) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="update semi_goods set g_stock=g_stock-? where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, ordernum);
			ps.setInt(2, g_idx);
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
				e2.printStackTrace();
			}
		}
	}
	
	//재고 가져오는 메서드
	public int getStock(int g_idx) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="select g_stock from semi_goods where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, g_idx);
			rs=ps.executeQuery();
			int g_stock=0;
			if(rs.next()) {
				g_stock=rs.getInt("g_stock");
			}
			
			return g_stock;
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
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
	
	//ordernum 수정
	public int updateOrdernum(int ordernum,int c_idx) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="update semi_cart set ordernum=? where c_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, ordernum);
			ps.setInt(2, c_idx);
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
				e2.printStackTrace();
			}
		}
	}
}
