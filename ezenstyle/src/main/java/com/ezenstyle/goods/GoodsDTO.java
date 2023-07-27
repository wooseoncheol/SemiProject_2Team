package com.ezenstyle.goods;

public class GoodsDTO {
	private int idx;
	private String g_name;
	private String g_ofile;
	private String g_nfile;
	private String g_color;
	private String g_size;
	private int g_stock;
	private int g_price;
	private String g_category;
	private String g_detail;
	private int readnum;
	
	public GoodsDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public GoodsDTO(String g_name, String g_ofile, String g_nfile, String g_color, String g_size, int g_stock,
			int g_price, String g_category, String g_detail) {
		super();
		this.g_name = g_name;
		this.g_ofile = g_ofile;
		this.g_nfile = g_nfile;
		this.g_color = g_color;
		this.g_size = g_size;
		this.g_stock = g_stock;
		this.g_price = g_price;
		this.g_category = g_category;
		this.g_detail = g_detail;
	}
	

	public GoodsDTO(int idx, String g_name, String g_ofile, String g_nfile, String g_color, String g_size, int g_stock,
			int g_price, String g_category, String g_detail, int readnum) {
		super();
		this.idx = idx;
		this.g_name = g_name;
		this.g_ofile = g_ofile;
		this.g_nfile = g_nfile;
		this.g_color = g_color;
		this.g_size = g_size;
		this.g_stock = g_stock;
		this.g_price = g_price;
		this.g_category = g_category;
		this.g_detail = g_detail;
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

	public String getG_ofile() {
		return g_ofile;
	}

	public void setG_ofile(String g_ofile) {
		this.g_ofile = g_ofile;
	}

	public String getG_nfile() {
		return g_nfile;
	}

	public void setG_nfile(String g_nfile) {
		this.g_nfile = g_nfile;
	}

	public String getG_color() {
		return g_color;
	}

	public void setG_color(String g_color) {
		this.g_color = g_color;
	}

	public String getG_size() {
		return g_size;
	}

	public void setG_size(String g_size) {
		this.g_size = g_size;
	}

	public int getG_stock() {
		return g_stock;
	}

	public void setG_stock(int g_stock) {
		this.g_stock = g_stock;
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

	public String getG_detail() {
		return g_detail;
	}

	public void setG_detail(String g_detail) {
		this.g_detail = g_detail;
	}

	public int getReadnum() {
		return readnum;
	}

	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}

	
	
}
