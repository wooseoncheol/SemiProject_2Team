package com.ezenstyle.member;

import java.sql.*;
import java.util.*;

import org.apache.commons.collections4.functors.ExceptionPredicate;

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
	
	/** 마이페이지 메소드_유성진*/
	public ArrayList<MemberDTO> getuserInfo(String id){
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="select idx, substr(id,1,1)||lpad('*',3,'*') as mid, name, lpad('*',4,'*') as mpwd, substr(email,1,3)||lpad('*',5,'*') as memail, lpad('*',length(adr),'*') as madr, substr(tel,1,4)||lpad('*',4,'*')||substr(tel,-5) as mtel, mgr from semi_member where id = ?";
			
			ArrayList<MemberDTO> arr=new ArrayList<MemberDTO>();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				do {
					int idx = rs.getInt("idx");
					String mid = rs.getString("mid");
					String mname = rs.getString("name");
					String mpwd = rs.getString("mpwd");
					String memail = rs.getString("memail");
					String madr = rs.getString("madr");
					String mtel = rs.getString("mtel");
					int mgr = rs.getInt("mgr");
					
					MemberDTO dto = new MemberDTO(idx, mid, mname, mpwd, memail, madr, mtel, mgr);
					arr.add(dto);
				}
				while(rs.next());
				return arr;
				
			}else {
				return null;
			}
			
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
				return null;
			}
		}
	}
	
	/** 마이페이지 _정보수정_1 메소드_유성진*/
	public MemberDTO updateInfo1(String id, String pwd){
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql = "select * from semi_member where id =? and pwd= ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pwd);
			rs = ps.executeQuery();
			MemberDTO dto = null;
			if(rs.next()) {
				
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String adr = rs.getString("adr");
				String tel = rs.getString("tel");
				int mgr = rs.getInt("mgr");
					
				dto = new MemberDTO(idx, id, name, pwd, email, adr, tel, mgr);

			}return dto;

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
	
	/** 마이페이지 _정보수정_2 메소드_유성진*/
	public int updateInfo2(MemberDTO dto) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="update semi_member set name=?, pwd=?, email=?, adr=?, tel=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getEmail());
			ps.setString(4, dto.getAdr());
			ps.setString(5, dto.getTel());
			int count = ps.executeUpdate();
			
			return count;
			
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e1) {
				
			}
			
		}
	}
	
	
	
	
}
