package com.ezenstyle.admin;

import java.sql.*;
import java.util.*;
import com.ezenstyle.member.MemberDTO;

public class AdminDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public AdminDAO() {
		// TODO Auto-generated constructor stub
	}
	
	/**관리자페이지 삽입 기능_재영*/
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
			} catch (Exception e2) {}
		}
		
	}
	

}
