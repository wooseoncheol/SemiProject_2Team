package com.ezenstyle.cart;

public class CartDTO {

	private String id;
	private int g_idx;
	private String g_name;
	private int g_price;
	private int ordernum;
	
	public CartDTO() {
		// TODO Auto-generated constructor stub
	}

	public CartDTO(String id, int g_idx, String g_name, int g_price, int ordernum) {
		super();
		this.id = id;
		this.g_idx = g_idx;
		this.g_name = g_name;
		this.g_price = g_price;
		this.ordernum = ordernum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getG_idx() {
		return g_idx;
	}

	public void setG_idx(int g_idx) {
		this.g_idx = g_idx;
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

	public int getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
}
