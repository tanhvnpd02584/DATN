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
@Table(name = "danhmuc")
public class danhmuc {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int iddanhmuc;
	private String tendanhmuc;

	@OneToMany(mappedBy = "danhmuc", fetch = FetchType.EAGER)
	List<loaisach> loaisach;

	public int getIddanhmuc() {
		return iddanhmuc;
	}

	public void setIddanhmuc(int iddanhmuc) {
		this.iddanhmuc = iddanhmuc;
	}

	public String getTendanhmuc() {
		return tendanhmuc;
	}

	public void setTendanhmuc(String tendanhmuc) {
		this.tendanhmuc = tendanhmuc;
	}

	public List<loaisach> getLoaisach() {
		return loaisach;
	}

	public void setLoaisach(List<loaisach> loaisach) {
		this.loaisach = loaisach;
	}

	public danhmuc(int iddanhmuc, String tendanhmuc, List<com.poly.entity.loaisach> loaisach) {
		super();
		this.iddanhmuc = iddanhmuc;
		this.tendanhmuc = tendanhmuc;
		this.loaisach = loaisach;
	}

	public danhmuc() {
		super();
		// TODO Auto-generated constructor stub
	}

}
