package com.ezenstyle.qna;

import java.util.*;

public class QnaDTO {
	
	private int idx;
	private String id;
	private String subject;
	private String content;
	private Date writedate;
	private int ref;
	private int lev;
	private int sunbun;
	
	public QnaDTO() {
		
	}

	public QnaDTO(int idx, String id, String subject, String content, Date writedate, int ref, int lev, int sunbun) {
		super();
		this.idx = idx;
		this.id = id;
		this.subject = subject;
		this.content = content;
		this.writedate = writedate;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getSunbun() {
		return sunbun;
	}

	public void setSunbun(int sunbun) {
		this.sunbun = sunbun;
	}
	
	
	
}
