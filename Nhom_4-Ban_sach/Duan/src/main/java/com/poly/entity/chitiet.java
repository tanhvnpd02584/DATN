package com.poly.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "chitiet")
public class chitiet {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idchitiet;
	private int soluong;
	private int dongia;
	private int thanhtien;
	@ManyToOne
	@JoinColumn(name = "iddonhang")
	donhang donhang;
	@ManyToOne
	@JoinColumn(name = "idsach")
	sach sach;

	public chitiet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public chitiet(int idchitiet, int soluong, int dongia, int thanhtien, com.poly.entity.donhang donhang,
			com.poly.entity.sach sach) {
		super();
		this.idchitiet = idchitiet;
		this.soluong = soluong;
		this.dongia = dongia;
		this.thanhtien = thanhtien;
		this.donhang = donhang;
		this.sach = sach;
	}

	public int getIdchitiet() {
		return idchitiet;
	}

	public void setIdchitiet(int idchitiet) {
		this.idchitiet = idchitiet;
	}

	public int getSoluong() {
		return soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

	public int getDongia() {
		return dongia;
	}

	public void setDongia(int dongia) {
		this.dongia = dongia;
	}

	public int getThanhtien() {
		return thanhtien;
	}

	public void setThanhtien(int thanhtien) {
		this.thanhtien = thanhtien;
	}

	public donhang getDonhang() {
		return donhang;
	}

	public void setDonhang(donhang donhang) {
		this.donhang = donhang;
	}

	public sach getSach() {
		return sach;
	}

	public void setSach(sach sach) {
		this.sach = sach;
	}

}
