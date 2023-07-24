package com.ezenstyle.member;

import java.sql.*;
import java.util.*;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	// 상수, 누구나사용가능, 바로사용가능
	final public static int NOT_ID=1;
	final public static int NOT_PWD=2;
	final public static int LOGIN_OK=3;
	final public static int ERROR=-1;
	
	public MemberDAO() {
		System.out.println("DAO호출");//test
	}
	/** 회원가입 메소드_유성진*/
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
	
	/** 회원가입_아이디 중복 메소드_유성진*/
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
	
	/** 로그인 메소드_유성진*/
	public int loginCheck(String userid, String userpwd){
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="select pwd from semi_member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			if(rs.next()) {
				String dbpwd=rs.getString(1);
				if(dbpwd.equals(userpwd)) {
					return LOGIN_OK;
				}else {
					return NOT_PWD;
				}
			}else {
				return NOT_ID;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
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
	
	/** 로그인_아이디 기억하기_메소드_유성진*/
	public String getUserInfo(String id) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql = "select name from semi_member where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			rs.next();
			return rs.getString(1);
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
	
}
