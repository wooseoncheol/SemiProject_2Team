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
			String sql = "insert into semi_member values(semi_member_idx.nextval,?,?,?,?,?,?,?,?,0)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getPwd());
			ps.setString(4, dto.getQuestion());
			ps.setString(5, dto.getAnswer());
			ps.setString(6, dto.getEmail());
			ps.setString(7, dto.getAdr());
			ps.setString(8, dto.getTel());
			
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
			String sql="select idx, substr(id,1,1)||lpad('*',4,'*') as mid, name, lpad('*',4,'*') as mpwd, substr(email,1,3)||lpad('*',4,'*') as memail, lpad('*',length(adr),'*') as madr, substr(tel,1,4)||lpad('*',4,'*') as mtel, mgr from semi_member where id = ?";
			
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
	public int updateInfo2(MemberDTO dto,String id) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="update semi_member set name=?, pwd=?, email=?, adr=?, tel=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getEmail());
			ps.setString(4, dto.getAdr());
			ps.setString(5, dto.getTel());
			ps.setString(6, id);
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
	
	/**아이디 찾기 메소드 윤지영*/
	public String getUserId(String name,String tel,String question, String answer) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="select id from semi_member where name=? and tel=? and question=? and answer=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, tel);
			ps.setString(3, question);
			ps.setString(4, answer);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				String id=rs.getString("id");
				return id;
			}else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				
			}
		}
	}
	/**비밀번호 찾기 관련 메소드_김시연*/
	public boolean getUserPwd(String id, String name, String tel) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			
			String sql="select idx from semi_member where id=? and name=? and tel=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, tel);
			rs=ps.executeQuery();
			
			return rs.next();
			
					
		} catch (Exception e) {
			e.printStackTrace();
			return false;
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
	/**비밀번호 재설정 관련 메소드_김시연*/
	public int pwdReset(String id, String pwd) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			
			String sql="update semi_member set pwd=? where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, pwd);
			ps.setString(2, id);
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
				// TODO: handle exception
			}
		}
	}
	/**결제 페이지에서 사용자 정보 출력 관련 메소드_김시연*/
	public MemberDTO printMember(String id) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			
			String sql="select * from semi_member where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				
				String name=rs.getString("name");
				String email=rs.getString("email");
				String adr=rs.getString("adr");
				String tel=rs.getString("tel");
				
				MemberDTO dto=new MemberDTO(id, name, email, adr, tel);
				
				return dto;
			}else {
				return null;
			}
			
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
	//탈퇴 시 비밀번호 확인-염한별 
	public String pwdDelete(String id) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="select pwd from semi_member where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			String pwd="";
			if(rs.next()) {
				pwd=rs.getString("pwd");
			}
			return pwd;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				
			}
		}
	}
	
	// 회원 탈퇴
	public int memberDel(String id) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="delete from semi_member where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			int count = ps.executeUpdate();
			return count;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/**관리자 삽입 기능_재영*/
	public int adminPage(String id) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="select mgr from semi_member where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			rs.next();
			return rs.getInt("mgr");
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				
			}
			
		}
	}
	
}
