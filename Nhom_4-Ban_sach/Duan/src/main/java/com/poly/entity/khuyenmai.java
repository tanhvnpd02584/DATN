package com.poly.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "khuyenmai")
public class khuyenmai {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idkm;
	private String tenchuongtrinh;
	private int giamphantram;
	private boolean trangthai;

	@ManyToOne
	@JoinColumn(name = "idsach")
	sach sach;

	public khuyenmai() {
		super();
		// TODO Auto-generated constructor stub
	}

	public khuyenmai(int idkm, String tenchuongtrinh, int giamphantram, boolean trangthai, com.poly.entity.sach sach) {
		super();
		this.idkm = idkm;
		this.tenchuongtrinh = tenchuongtrinh;
		this.giamphantram = giamphantram;
		this.trangthai = trangthai;
		this.sach = sach;
	}

	public int getIdkm() {
		return idkm;
	}

	public void setIdkm(int idkm) {
		this.idkm = idkm;
	}

	public String getTenchuongtrinh() {
		return tenchuongtrinh;
	}

	public void setTenchuongtrinh(String tenchuongtrinh) {
		this.tenchuongtrinh = tenchuongtrinh;
	}

	public int getGiamphantram() {
		return giamphantram;
	}

	public void setGiamphantram(int giamphantram) {
		this.giamphantram = giamphantram;
	}

	public boolean isTrangthai() {
		return trangthai;
	}

	public void setTrangthai(boolean trangthai) {
		this.trangthai = trangthai;
	}

	public sach getSach() {
		return sach;
	}

	public void setSach(sach sach) {
		this.sach = sach;
	}

}
