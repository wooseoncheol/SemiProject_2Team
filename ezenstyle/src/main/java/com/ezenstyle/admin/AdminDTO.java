package com.ezenstyle.admin;

import java.sql.*;

public class AdminDTO {

	private int o_idx;
	private String id;
	private String g_img;
	private String g_name;
	private int g_price;
	private int ordernumber;
	private Date orderdate;
	private String o_state;
	
	public AdminDTO() {
	
	}

	public AdminDTO(int o_idx, String id, String g_img, String g_name, int g_price, int ordernumber, Date orderdate,
			String o_state) {
		super();
		this.o_idx = o_idx;
		this.id = id;
		this.g_img = g_img;
		this.g_name = g_name;
		this.g_price = g_price;
		this.ordernumber = ordernumber;
		this.orderdate = orderdate;
		this.o_state = o_state;
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

	public String getG_img() {
		return g_img;
	}

	public void setG_img(String g_img) {
		this.g_img = g_img;
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

	public int getOrdernumber() {
		return ordernumber;
	}

	public void setOrdernumber(int ordernumber) {
		this.ordernumber = ordernumber;
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
