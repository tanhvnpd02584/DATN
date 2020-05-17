package com.poly.entity;

import java.io.Serializable;

public class item implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private sach Sach;
	private int soluong;
	private int gia;

	public item() {
		super();
		// TODO Auto-generated constructor stub
	}

	public item(int id, sach sach, int soluong, int gia) {
		super();
		this.id = id;
		Sach = sach;
		this.soluong = 1;
		this.gia = gia;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public sach getSach() {
		return Sach;
	}

	public void setSach(sach sach) {
		Sach = sach;
	}

	public int getSoluong() {
		return soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

	public int getGia() {
		return gia;
	}

	public void setGia(int gia) {
		this.gia = gia;
	}
}
