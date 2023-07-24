package com.ezenstyle.notice;

import java.util.*;

public class NoticeDTO {

	private int idx;
	private String subject;
	private String content;
	private Date writedate;
	private int readnum;
	private int ref;
	
	public NoticeDTO() {
	
	}

	public NoticeDTO(int idx, String subject, String content, Date writedate, int readnum, int ref) {
		super();
		this.idx = idx;
		this.subject = subject;
		this.content = content;
		this.writedate = writedate;
		this.readnum = readnum;
		this.ref = ref;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
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

	public int getReadnum() {
		return readnum;
	}

	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}
	
	
}
