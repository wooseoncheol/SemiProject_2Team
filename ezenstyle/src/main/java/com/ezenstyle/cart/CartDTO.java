package com.ezenstyle.cart;

public class CartDTO {

	private String id;
	private int g_idx;
	private String g_nfile;
	private String g_category;
	private String g_name;
	private int g_price;
	private String g_size;
	private int ordernum;
	
	public CartDTO() {
		// TODO Auto-generated constructor stub
	}



	public CartDTO(String id, int g_idx, String g_nfile, String g_category, String g_name, int g_price, String g_size,
			int ordernum) {
		super();
		this.id = id;
		this.g_idx = g_idx;
		this.g_nfile = g_nfile;
		this.g_category = g_category;
		this.g_name = g_name;
		this.g_price = g_price;
		this.g_size = g_size;
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
	
	

	public String getG_nfile() {
		return g_nfile;
	}

	public void setG_nfile(String g_nfile) {
		this.g_nfile = g_nfile;
	}


	public String getG_category() {
		return g_category;
	}


	public void setG_category(String g_category) {
		this.g_category = g_category;
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
	

	public String getG_size() {
		return g_size;
	}



	public void setG_size(String g_size) {
		this.g_size = g_size;
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
