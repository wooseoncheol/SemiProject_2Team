package com.ezenstyle.member;

public class MemberDTO {
	private int idx;//회원 고유 번호
	private String id;//회원 아이디
	private String name;//회원 이름 
	private String pwd;//회원 비밀번호
	private String email;//회원 이메일
	private String adr;//회원 주소
	private String tel;//회원 전화번호
	private int mgr;// 매니저 계정과 일반 계정 구분 (1:관리자, 0: 일반사용자)
	
	public MemberDTO() {
		System.out.println("DTO호출");//test
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAdr() {
		return adr;
	}
	public void setAdr(String adr) {
		this.adr = adr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getMgr() {
		return mgr;
	}
	public void setMgr(int mgr) {
		this.mgr = mgr;
	}

}
