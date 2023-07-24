package com.ezenstyle.goods;

public class GoodsDTO {
	private int idx;
	private String g_name;
	private String g_img;
	private String g_size;
	private int g_price;
	private String g_category;
	private int readnum;
	
	public GoodsDTO() {
		// TODO Auto-generated constructor stub
	}

	public GoodsDTO(int idx, String g_name, String g_img, String g_size, int g_price, String g_category, int readnum) {
		super();
		this.idx = idx;
		this.g_name = g_name;
		this.g_img = g_img;
		this.g_size = g_size;
		this.g_price = g_price;
		this.g_category = g_category;
		this.readnum = readnum;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public String getG_img() {
		return g_img;
	}

	public void setG_img(String g_img) {
		this.g_img = g_img;
	}

	public String getG_size() {
		return g_size;
	}

	public void setG_size(String g_size) {
		this.g_size = g_size;
	}

	public int getG_price() {
		return g_price;
	}

	public void setG_price(int g_price) {
		this.g_price = g_price;
	}

	public String getG_category() {
		return g_category;
	}

	public void setG_category(String g_category) {
		this.g_category = g_category;
	}

	public int getReadnum() {
		return readnum;
	}

	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}
	
	
}
