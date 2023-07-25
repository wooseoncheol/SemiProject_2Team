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
				String g_img=rs.getString("g_img");
				String g_size=rs.getString("g_size");
				int g_price=rs.getInt("g_price");
				String g_category=rs.getString("g_category");
				int readnum=rs.getInt("readnum");
				
				GoodsDTO dto=new GoodsDTO(idx, g_name, g_img, g_size, g_price, g_category, readnum);
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
				String g_img=rs.getString("g_img");
				String g_size=rs.getString("g_size");
				int g_price=rs.getInt("g_price");
				String g_category=rs.getString("g_category");
				int readnum=rs.getInt("readnum");
				
				GoodsDTO dto2=new GoodsDTO(idx, g_name, g_img, g_size, g_price, g_category, readnum);
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
				String g_img=rs.getString("g_img");
				String g_size=rs.getString("g_size");
				int g_price=rs.getInt("g_price");
				String g_category=rs.getString("g_category");
				int readnum=rs.getInt("readnum");
				
				GoodsDTO dto=new GoodsDTO(idx, g_name, g_img, g_size, g_price, g_category, readnum);
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
