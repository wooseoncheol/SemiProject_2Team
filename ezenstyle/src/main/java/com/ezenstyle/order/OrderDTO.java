package com.ezenstyle.order;

import java.sql.*;

public class OrderDTO {
	
	private int o_idx;
	private String id;
	private String name;
	private String adr;
	private String tel;
	private String g_nfile;
	private String g_name;
	private int g_price;
	private String g_size;
	private int ordernum;
	private String g_category;
	private Date orderdate;
	private String o_state;
	private int del_state;
	private int max;
	private int rn;
	
	public OrderDTO() {
		// TODO Auto-generated constructor stub
	}

	public OrderDTO(int o_idx, String id, String name, String adr, String tel, String g_nfile, String g_name,
			int g_price, String g_size, int ordernum, String g_category, Date orderdate, String o_state, int del_state,
			int max, int rn) {
		super();
		this.o_idx = o_idx;
		this.id = id;
		this.name = name;
		this.adr = adr;
		this.tel = tel;
		this.g_nfile = g_nfile;
		this.g_name = g_name;
		this.g_price = g_price;
		this.g_size = g_size;
		this.ordernum = ordernum;
		this.g_category = g_category;
		this.orderdate = orderdate;
		this.o_state = o_state;
		this.del_state = del_state;
		this.max = max;
		this.rn = rn;
	}

	public OrderDTO(String id, String name, String adr, String tel, String g_nfile, String g_name, int g_price,
			String g_size, int ordernum, String g_category, String o_state) {
		super();
		this.id = id;
		this.name = name;
		this.adr = adr;
		this.tel = tel;
		this.g_nfile = g_nfile;
		this.g_name = g_name;
		this.g_price = g_price;
		this.g_size = g_size;
		this.ordernum = ordernum;
		this.g_category = g_category;
		this.o_state = o_state;
	}



	public OrderDTO(int o_idx, String id, String name, String adr, String tel, String g_nfile, String g_name,
			int g_price, String g_size, int ordernum, String g_category, Date orderdate, String o_state) {
		super();
		this.o_idx = o_idx;
		this.id = id;
		this.name = name;
		this.adr = adr;
		this.tel = tel;
		this.g_nfile = g_nfile;
		this.g_name = g_name;
		this.g_price = g_price;
		this.g_size = g_size;
		this.ordernum = ordernum;
		this.g_category = g_category;
		this.orderdate = orderdate;
		this.o_state = o_state;
	}
	
	public OrderDTO(int rn, int max, int o_idx, String name, String adr, String g_name, Date orderdate, String o_state, int del_state) {
		this.max=max;
		this.o_idx=o_idx;
		this.name=name;
		this.adr=adr;
		this.g_name=g_name;
		this.orderdate=orderdate;
		this.o_state=o_state;
		this.del_state=del_state;
		this.rn=rn;
	}

	
	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public int getMax() {
		return max;
	}


	public void setMax(int max) {
		this.max = max;
	}


	public int getDel_state() {
		return del_state;
	}



	public void setDel_state(int del_state) {
		this.del_state = del_state;
	}



	public int getO_idx() {
		return o_idx;
	}

	public void setO_idx(int o_idx) {
		this.o_idx = o_idx;
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

	public String getG_nfile() {
		return g_nfile;
	}

	public void setG_nfile(String g_nfile) {
		this.g_nfile = g_nfile;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public int getG_price() {
		return g_price;
	}

	public void setG_price(int g_price) {
		this.g_price = g_price;
	}

	public String getG_size() {
		return g_size;
	}

	public void setG_size(String g_size) {
		this.g_size = g_size;
	}

	public int getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}

	public String getG_category() {
		return g_category;
	}

	public void setG_category(String g_category) {
		this.g_category = g_category;
	}

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	public String getO_state() {
		return o_state;
	}

	public void setO_state(String o_state) {
		this.o_state = o_state;
	}
	
	
	
	

}
