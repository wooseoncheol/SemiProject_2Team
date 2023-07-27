package com.ezenstyle.notice;

import java.sql.*;
import java.util.*;
import com.ezenstyle.member.MemberDTO;

public class NoticeDAO {
	
	private PreparedStatement ps;
	private Connection conn;
	private ResultSet rs;
	
	public NoticeDAO() {

	}
	/**관리자 계정 판단_재영*/
	public int mgrJudge(String id) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="select mgr from semi_member where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			rs.next();
			int mgr=rs.getInt("mgr");
			return mgr;
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
	
	
	/**총 게시물 수 관련 메서드_재영*/
	public int getTotalCnt() {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="select count(*) from semi_notice";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			return count==0?1:count;	
			
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		} finally {
			try {
				if (rs!=null)rs.close();
				if (ps!=null)ps.close();
				if (conn!=null)conn.close();
			} catch (Exception e2) {
				
			}
		}
		
	}
	
	/**목록 관련 메서스_재영*/
	public ArrayList<NoticeDTO> noticeList(int cp, int ls) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			int start=(cp-1)*ls+1;
			int end=cp*ls;
			String sql="select * from (select rownum as rnum, a.* from "
					+ "(select * from semi_notice order by ref asc) a) b "
					+ "where rnum>=? and rnum<=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs=ps.executeQuery();
			ArrayList<NoticeDTO> arr=new ArrayList<NoticeDTO>();
			if (rs.next()) {
				do {
					int idx=rs.getInt("idx");
					String subject=rs.getString("subject");
					String content=rs.getString("content");
					java.util.Date writedate=rs.getDate("writedate");
					int readnum=rs.getInt("readnum");
					int ref=rs.getInt("ref");
					
					NoticeDTO dto=new NoticeDTO(idx, subject, content, writedate, readnum, ref);
					arr.add(dto);
				} while (rs.next());
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
			} catch (Exception e2) {}
		}
		
	}
	
	/**마지막 ref값 구하기_재영*/
	public int getMaxRef() {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="select max(ref) from semi_notice";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int count=0;
			if(rs.next()) {
				count=rs.getInt(1);
			}
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			} catch (Exception e2) {}
		}
		
	}
	
	
	/**자주묻는 게시판 글쓰기_재영*/
	public int noticeWrite(NoticeDTO dto) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			int ref=getMaxRef();
			String sql="insert into semi_notice values (semi_notice_idx.nextval,?,?,sysdate,0,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getSubject());
			ps.setString(2, dto.getContent());
			ps.setInt(3, ref+1);
			int count=ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps!=null)ps.close();
				if (conn!=null)conn.close();
			} catch (Exception e2) {}
		}		
	}
	
	/**공지사항 글쓰기_재영*/
	public int announceWrite(NoticeDTO dto) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="insert into semi_notice values (semi_notice_idx.nextval,?,?,sysdate,0,0)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getSubject());
			ps.setString(2, dto.getContent());
			int count=ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps!=null)ps.close();
				if (conn!=null)conn.close();
			} catch (Exception e2) {}
		}		
	}
	
	/**본문 관련 메소드_재영*/
	public NoticeDTO noticeContent(int idx) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="select * from semi_notice where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			NoticeDTO dto=null;
			if (rs.next()) {
				String subject=rs.getString("subject");
				String content=rs.getString("content");
				java.util.Date writedate=rs.getDate("writedate");
				int readnum=rs.getInt("readnum");
				int ref=rs.getInt("ref");
				
				dto=new NoticeDTO(idx, subject, content, writedate, readnum, ref);
			}
			return dto;
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
	
	/**조회수 관련 메소드_재영*/
	public void noticeReadnum(int idx, int readnum) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="update semi_notice set readnum=readnum+1 where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			ps.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) { }
		}
	}
	
	/**게시판 삭제*/
	public int noticeDelete(int idx) {
		try {
		 conn=com.ezenstyle.db.EzenDB.getConn();
		 String sql="Delete from semi_notice where idx=?";
		 ps=conn.prepareStatement(sql);
		 ps.setInt(1, idx);
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
	
}
