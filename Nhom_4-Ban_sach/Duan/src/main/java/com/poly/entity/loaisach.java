package com.poly.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "loaisach")
public class loaisach {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idloai;
	private String tenloai;

	@ManyToOne
	@JoinColumn(name = "iddanhmuc")
	danhmuc danhmuc;

	@OneToMany(mappedBy = "loaisach", fetch = FetchType.EAGER)
	List<sach> sach;

	public loaisach() {
		super();
		// TODO Auto-generated constructor stub
	}

	public loaisach(int idloai, String tenloai, com.poly.entity.danhmuc danhmuc, List<com.poly.entity.sach> sach) {
		super();
		this.idloai = idloai;
		this.tenloai = tenloai;
		this.danhmuc = danhmuc;
		this.sach = sach;
	}

	public int getIdloai() {
		return idloai;
	}

	public void setIdloai(int idloai) {
		this.idloai = idloai;
	}

	public String getTenloai() {
		return tenloai;
	}

	public void setTenloai(String tenloai) {
		this.tenloai = tenloai;
	}

	public danhmuc getDanhmuc() {
		return danhmuc;
	}

	public void setDanhmuc(danhmuc danhmuc) {
		this.danhmuc = danhmuc;
	}

	public List<sach> getSach() {
		return sach;
	}

	public void setSach(List<sach> sach) {
		this.sach = sach;
	}

}
