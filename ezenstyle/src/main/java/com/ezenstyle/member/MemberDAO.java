package com.ezenstyle.member;

import java.sql.*;
import java.util.*;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public MemberDAO() {
		System.out.println("DAO호출");//test
	}
	
	public int memberInsert(MemberDTO dto) {
		
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			System.out.println("연결성공");
			String sql = "insert into semi_member values(semi_member_idx.nextval,?,?,?,?,?,?,0)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getPwd());
			ps.setString(4, dto.getEmail());
			ps.setString(5, dto.getAdr());
			ps.setString(6, dto.getTel());
			
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
				e1.printStackTrace();
			}
		}
	}
	
	public int memberDuplication(String id) {
		try {
			
			conn=com.ezenstyle.db.EzenDB.getConn();
			
			String sql="select count(*) as idc from semi_member where id = ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			int count = -1;
			if(rs.next()) {
				count = rs.getInt("idc");
			}
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				
			}
		}
		
	}
	
	
}
