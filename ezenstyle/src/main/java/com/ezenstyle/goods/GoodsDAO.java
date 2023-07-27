package com.ezenstyle.goods;

import java.sql.*;
import java.util.*;

public class GoodsDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public GoodsDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public int goodsInsert(GoodsDTO dto) {
		try{
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql = "insert into semi_goods values(semi_goods_idx.nextval,?,?,?,?,?,?,?,?,?,0)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getG_category());
			ps.setString(2, dto.getG_name());
			ps.setString(3, dto.getG_ofile());
			ps.setString(4,dto.getG_nfile());
			ps.setString(5,dto.getG_color());
			ps.setString(6,dto.getG_size());
			ps.setInt(7,dto.getG_stock());
			ps.setInt(8,dto.getG_price());
			ps.setString(9,dto.getG_detail());
			

			int count = ps.executeUpdate();
			
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e1){
				
			}
		}
		
	}
	
	public ArrayList<GoodsDTO> bestItemList(){
		
		int count=0;
		
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			
			String sql="select * from semi_goods order by readnum desc";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			ArrayList<GoodsDTO> arr=new ArrayList<GoodsDTO>();
			
			while(rs.next()) {
				
				if(count==5) {break;}

				int idx=rs.getInt("idx");
				String g_name=rs.getString("g_name");
				String g_size=rs.getString("g_size");
				String g_ofile=rs.getString("g_ofile");
				String g_nfile=rs.getString("g_nfile");
				String g_color=rs.getString("g_color");
				int g_price=rs.getInt("g_price");
				int g_stock=rs.getInt("g_stock");
				String g_category=rs.getString("g_category");
				String g_detail=rs.getString("g_detail");
				int readnum=rs.getInt("readnum");
				
				GoodsDTO dto=new GoodsDTO(idx, g_name, g_ofile, g_nfile, g_color, g_size, g_stock,g_price, g_category, g_detail, readnum);
				arr.add(dto);
				
				count++;
			}
				

			return arr;
			
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
	public ArrayList<GoodsDTO> newItemList(){
		
		int count=0;
		
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			
			String sql="select * from semi_goods order by idx desc";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			ArrayList<GoodsDTO> arr2=new ArrayList<GoodsDTO>();
			
			while(rs.next()) {
				
				if(count==5) {break;}

				int idx=rs.getInt("idx");
				String g_name=rs.getString("g_name");
				String g_size=rs.getString("g_size");
				String g_ofile=rs.getString("g_ofile");
				String g_nfile=rs.getString("g_nfile");
				String g_color=rs.getString("g_color");
				int g_price=rs.getInt("g_price");
				int g_stock=rs.getInt("g_stock");
				String g_category=rs.getString("g_category");
				String g_detail=rs.getString("g_detail");
				int readnum=rs.getInt("readnum");
				
				GoodsDTO dto2=new GoodsDTO(idx, g_name, g_ofile, g_nfile, g_color, g_size, g_stock,g_price, g_category, g_detail, readnum);
				arr2.add(dto2);
				
				count++;
			}
				

			return arr2;
			
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
	
	//검색 기능 
	public ArrayList<GoodsDTO> searchItem(String userInput){
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="select * from semi_goods where g_name like '%"+userInput+"%'";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<GoodsDTO> arr=new ArrayList<GoodsDTO>();
			while(rs.next()) {
				int idx=rs.getInt("idx");
				String g_name=rs.getString("g_name");
				String g_size=rs.getString("g_size");
				String g_ofile=rs.getString("g_ofile");
				String g_nfile=rs.getString("g_nfile");
				String g_color=rs.getString("g_color");
				int g_price=rs.getInt("g_price");
				int g_stock=rs.getInt("g_stock");
				String g_category=rs.getString("g_category");
				String g_detail=rs.getString("g_detail");
				int readnum=rs.getInt("readnum");
				
				GoodsDTO dto=new GoodsDTO(idx, g_name, g_ofile, g_nfile, g_color, g_size, g_stock,g_price, g_category, g_detail, readnum);
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
