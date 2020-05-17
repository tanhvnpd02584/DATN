package com.poly.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "nhanvien")
public class nhanvien {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idnhanvien;
	private String cmnd;
	private String sdt;
	private String email;
	private boolean quyen;
	private String matkhau;
	private String sonha;
	private String hoten;

	public nhanvien() {
		super();
		// TODO Auto-generated constructor stub
	}

	public nhanvien(int idnhanvien, String cmnd, String sdt, String email, boolean quyen, String matkhau, String sonha,
			String hoten) {
		super();
		this.idnhanvien = idnhanvien;
		this.cmnd = cmnd;
		this.sdt = sdt;
		this.email = email;
		this.quyen = quyen;
		this.matkhau = matkhau;
		this.sonha = sonha;
		this.hoten = hoten;
	}

	public int getIdnhanvien() {
		return idnhanvien;
	}

	public void setIdnhanvien(int idnhanvien) {
		this.idnhanvien = idnhanvien;
	}

	public String getCmnd() {
		return cmnd;
	}

	public void setCmnd(String cmnd) {
		this.cmnd = cmnd;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isQuyen() {
		return quyen;
	}

	public void setQuyen(boolean quyen) {
		this.quyen = quyen;
	}

	public String getMatkhau() {
		return matkhau;
	}

	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}

	public String getSonha() {
		return sonha;
	}

	public void setSonha(String sonha) {
		this.sonha = sonha;
	}

	public String getHoten() {
		return hoten;
	}

	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
}
