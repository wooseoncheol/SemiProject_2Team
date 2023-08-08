package com.ezenstyle.qna;

import java.sql.*;
import java.util.*;

public class QnaDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public QnaDAO() {
		
	}
	
	/**마지막 ref 값 구하기 관련 메서드*/
	public int getMaxRef() {
		try { // bbsWrite() 메소드와 같이 실행하므로 conn 하지 않아도 됨
			String sql="select max(ref) from semi_qna";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int count=0;
			if(rs.next()) {
				count=rs.getInt(1); //1번째 컬럼값
			}
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			} catch (Exception e2) { }
		}
	}
	
	/**총 게시물 수 관련 메서드_재영*/
	public int getTotalMgrCnt() {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="select count(*) from semi_qna";
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
	
	/**총 게시물 수 관련 메서드_재영*/
	public int getTotalCnt(String id) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="select count(*) from semi_qna where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
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
	
	/**목록 관련 메서드_재영*/
	public ArrayList<QnaDTO> qnaList(int cp, int ls, String id) {
		try {
		 conn=com.ezenstyle.db.EzenDB.getConn();
		 int start=(cp-1)*ls+1;
		 int end=cp*ls;
		 String sql="select * from "
					+ "(select rownum as rnum,a.* from  "
					+ "(select * from semi_qna order by ref desc,sunbun asc) a) b "
					+ "where rnum>=? and rnum<=? and id=?";
		 ps=conn.prepareStatement(sql);
		 ps.setInt(1, start);
		 ps.setInt(2, end);
		 ps.setString(3, id);
		 rs=ps.executeQuery();
		 ArrayList<QnaDTO> arr=new ArrayList<QnaDTO>();
		 if (rs.next()) {
			 do {
				 int idx=rs.getInt("idx");
				 String subject=rs.getString("subject");
				 String content=rs.getString("content");
				 java.util.Date writedate=rs.getDate("writedate");
				 int ref=rs.getInt("ref");
				 int lev=rs.getInt("lev");
				 int sunbun=rs.getInt("sunbun");
				 
				 QnaDTO dto=new QnaDTO(idx, id, subject, content, writedate, ref, lev, sunbun);
				 
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
			} catch (Exception e2) { }
		}
	}
	
	/**관리자 전용 목록 관련 메서드_재영*/
	public ArrayList<QnaDTO> qnaMgrList(int cp, int ls) {
		try {
		 conn=com.ezenstyle.db.EzenDB.getConn();
		 int start=(cp-1)*ls+1;
		 int end=cp*ls;
		 String sql="select * from "
					+ "(select rownum as rnum,a.* from  "
					+ "(select * from semi_qna order by ref desc,sunbun asc) a) b "
					+ "where rnum>=? and rnum<=?";
		 ps=conn.prepareStatement(sql);
		 ps.setInt(1, start);
		 ps.setInt(2, end);
		 rs=ps.executeQuery();
		 ArrayList<QnaDTO> arr=new ArrayList<QnaDTO>();
		 if (rs.next()) {
			 do {
				 int idx=rs.getInt("idx");
				 String id=rs.getString("id");
				 String subject=rs.getString("subject");
				 String content=rs.getString("content");
				 java.util.Date writedate=rs.getDate("writedate");
				 int ref=rs.getInt("ref");
				 int lev=rs.getInt("lev");
				 int sunbun=rs.getInt("sunbun");
				 
				 QnaDTO dto=new QnaDTO(idx, id, subject, content, writedate, ref, lev, sunbun);
				 
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
			} catch (Exception e2) { }
		}
	}
	
	/**글쓰기 관련 메서드_재영*/
	public int qnaWrite(QnaDTO dto) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			int ref=getMaxRef();
			String sql="insert into semi_qna values (semi_qna_idx.nextval,?,?,?,sysdate,?,0,0)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getSubject());
			ps.setString(3, dto.getContent());
			ps.setInt(4, ref+1);
			int result=ps.executeUpdate();			
			return result;
			
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
	
	
	/**본문 보기 관련 메서드_재영*/
	public QnaDTO qnaContent(int idx) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="select * from semi_qna where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			QnaDTO dto=new QnaDTO();
			if (rs.next()) {
				String id=rs.getString("id");
				String subject=rs.getString("subject");
				String content=rs.getString("content");
				java.util.Date writedate=rs.getDate("writedate");
				int ref=rs.getInt("ref");
				int lev=rs.getInt("lev");
				int sunbun=rs.getInt("sunbun");
				
				dto=new QnaDTO(idx, id, subject, content, writedate, ref, lev, sunbun);
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
			} catch (Exception e2) {}
		}
	}
	
	/**순번 업데이트 기능_재영*/
	public void setUpdateSun(int ref, int sunbun) {
		try {
			String sql="update semi_qna set sunbun=sunbun+1 where ref=? and sunbun>=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, ref);
			ps.setInt(2, sunbun);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)ps.close();
			} catch (Exception e2) { }
			
		}
	}

	/**답변 쓰기 메서드_안재영*/
	public int qnaReWrite(QnaDTO dto) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			setUpdateSun(dto.getRef(), dto.getSunbun()+1);
			String sql="insert into semi_qna values(semi_qna_idx.nextval,?,?,?,sysdate,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getSubject());
			ps.setString(3, dto.getContent());
			ps.setInt(4, dto.getRef());
			ps.setInt(5, dto.getLev()+1);
			ps.setInt(6, dto.getSunbun()+1);
			int count=ps.executeUpdate();
			return count;
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
	
	/**게시판 삭제*/
	public int qnaDelete(int idx) {
		try {
		 conn=com.ezenstyle.db.EzenDB.getConn();
		 String sql="Delete from semi_qna where idx=?";
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
	
	/**작성자 변경 메소드_재영*/
	public int qnaChange(String id2, int ref, int lev, int sunbun) {
		try {
			conn=com.ezenstyle.db.EzenDB.getConn();
			String sql="update semi_qna set id=? where ref=? and lev=?+1 and sunbun=?+1";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id2);
			ps.setInt(2, ref);
			ps.setInt(3, lev);
			ps.setInt(4, sunbun);
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
