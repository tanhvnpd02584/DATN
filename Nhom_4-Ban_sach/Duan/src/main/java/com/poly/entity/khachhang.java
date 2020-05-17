package com.poly.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "khachhang")
public class khachhang {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idkhach;
	private String email;
	private String matkhau;
	private String hoten;
	private String cmnd;
	private String diachi;
	private String sdt;

	@OneToMany(mappedBy = "khachhang", fetch = FetchType.EAGER)
	List<donhang> donhang;

	public khachhang() {
		super();
		// TODO Auto-generated constructor stub
	}

	public khachhang(int idkhach, String email, String matkhau, String hoten, String cmnd, String diachi, String sdt,
			List<com.poly.entity.donhang> donhang) {
		super();
		this.idkhach = idkhach;
		this.email = email;
		this.matkhau = matkhau;
		this.hoten = hoten;
		this.cmnd = cmnd;
		this.diachi = diachi;
		this.sdt = sdt;
		this.donhang = donhang;
	}

	public int getIdkhach() {
		return idkhach;
	}

	public void setIdkhach(int idkhach) {
		this.idkhach = idkhach;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMatkhau() {
		return matkhau;
	}

	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}

	public String getHoten() {
		return hoten;
	}

	public void setHoten(String hoten) {
		this.hoten = hoten;
	}

	public String getCmnd() {
		return cmnd;
	}

	public void setCmnd(String cmnd) {
		this.cmnd = cmnd;
	}

	public String getDiachi() {
		return diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public List<donhang> getDonhang() {
		return donhang;
	}

	public void setDonhang(List<donhang> donhang) {
		this.donhang = donhang;
	}

}
