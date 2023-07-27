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
	//상품리스트 페이징을 위한 테이블 로우 카운트 메소드
	public int getTotalCnt(String category) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn(); 
			String sql = "select count(*) from semi_goods where g_category = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, category);
			rs = ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			return count==0?1:count;
			
		}catch(Exception e) {
			e.printStackTrace();
			return 1;
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
	// 카테고리별 상품리스트 출력 메소드 -우선철
	public ArrayList<GoodsDTO> showGoodsList(String category, int cp, int ls){
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			int start=(cp-1)*ls+1;
			int end=cp*ls;
			String sql=	 "select * from "
						+"(select rownum as rnum,a.* from "
						+"(select * from semi_goods where g_category = ? order by idx desc)a)b "
						+"where rnum>=? and rnum<=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, category);
			ps.setInt(2, start);
			ps.setInt(3, end);
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
	
	/**카테고리별 목록 보기_재영*/
	public ArrayList<GoodsDTO> adminCategory(String category){
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="select * from semi_goods where g_category=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, category);
			rs=ps.executeQuery();
			ArrayList<GoodsDTO> arr=new ArrayList<GoodsDTO>();
			while (rs.next()) {
				int idx=rs.getInt("idx");
				String name=rs.getString("g_name");
				String ofile=rs.getString("g_ofile");
				String nfile=rs.getString("g_nfile");
				String color=rs.getString("g_color");
				String size=rs.getString("g_size");
				int stock=rs.getInt("g_stock");
				String detail=rs.getString("g_detail");
				int readnum=rs.getInt("readnum");
				
				GoodsDTO dto=new GoodsDTO(idx, name, ofile, nfile, color, size, stock, stock, category, detail, readnum);
				
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
			} catch (Exception e2) { }
			
		}
		
	}
	
	/**상품 정보 수정_재영*/
	public int adminUpdate(int idx, String name, String color, String size, int stock, int price, String detail) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="update semi_goods set g_name=?, g_color=?, g_size=?, g_stock=?, "
					+ "g_price=?, g_detail=? where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, color);
			ps.setString(3, size);
			ps.setInt(4, stock);
			ps.setInt(5, price);
			ps.setString(6, detail);
			ps.setInt(7, idx);
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

	/**전체 목록 보기_재영*/
	public ArrayList<GoodsDTO> adminAll(){
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="select * from semi_goods";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<GoodsDTO> arr=new ArrayList<GoodsDTO>();
			while (rs.next()) {
				int idx=rs.getInt("idx");
				String category=rs.getString("g_category");
				String name=rs.getString("g_name");
				String ofile=rs.getString("g_ofile");
				String nfile=rs.getString("g_nfile");
				String color=rs.getString("g_color");
				String size=rs.getString("g_size");
				int stock=rs.getInt("g_stock");
				String detail=rs.getString("g_detail");
				int readnum=rs.getInt("readnum");
				
				GoodsDTO dto=new GoodsDTO(idx, name, ofile, nfile, color, size, stock, stock, category, detail, readnum);
				
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
			} catch (Exception e2) { }
			
		}
		
	}
	
	
}
