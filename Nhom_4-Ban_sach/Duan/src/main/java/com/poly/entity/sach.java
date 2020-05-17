package com.poly.entity;

import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "sach")
public class sach {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idsach;
	private int gia;
	private String nhaxuatban;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date ngayph;
	private String anhsach;
	private int soluong;
	private String tensach;
	private String tentacgia;
	@OneToMany(mappedBy = "sach")
	List<chitiet> chitiet;
	@OneToMany(mappedBy = "sach", fetch = FetchType.EAGER)
	List<khuyenmai> khuyenmai;
	@ManyToOne
	@JoinColumn(name = "idloai")
	loaisach loaisach;

	public sach() {
		super();
		// TODO Auto-generated constructor stub
	}

	public sach(int idsach, int gia, String nhaxuatban, Date ngayph, String anhsach, int soluong, String tensach,
			String tentacgia, List<com.poly.entity.chitiet> chitiet, List<com.poly.entity.khuyenmai> khuyenmai,
			com.poly.entity.loaisach loaisach) {
		super();
		this.idsach = idsach;
		this.gia = gia;
		this.nhaxuatban = nhaxuatban;
		this.ngayph = ngayph;
		this.anhsach = anhsach;
		this.soluong = soluong;
		this.tensach = tensach;
		this.tentacgia = tentacgia;
		this.chitiet = chitiet;
		this.khuyenmai = khuyenmai;
		this.loaisach = loaisach;
	}

	public int getIdsach() {
		return idsach;
	}

	public void setIdsach(int idsach) {
		this.idsach = idsach;
	}

	public int getGia() {
		return gia;
	}

	public void setGia(int gia) {
		this.gia = gia;
	}

	public String getNhaxuatban() {
		return nhaxuatban;
	}

	public void setNhaxuatban(String nhaxuatban) {
		this.nhaxuatban = nhaxuatban;
	}

	public Date getNgayph() {
		return ngayph;
	}

	public void setNgayph(Date ngayph) {
		this.ngayph = ngayph;
	}

	public String getAnhsach() {
		return anhsach;
	}

	public void setAnhsach(String anhsach) {
		this.anhsach = anhsach;
	}

	public int getSoluong() {
		return soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

	public String getTensach() {
		return tensach;
	}

	public void setTensach(String tensach) {
		this.tensach = tensach;
	}

	public String getTentacgia() {
		return tentacgia;
	}

	public void setTentacgia(String tentacgia) {
		this.tentacgia = tentacgia;
	}

	public List<chitiet> getChitiet() {
		return chitiet;
	}

	public void setChitiet(List<chitiet> chitiet) {
		this.chitiet = chitiet;
	}

	public List<khuyenmai> getKhuyenmai() {
		return khuyenmai;
	}

	public void setKhuyenmai(List<khuyenmai> khuyenmai) {
		this.khuyenmai = khuyenmai;
	}

	public loaisach getLoaisach() {
		return loaisach;
	}

	public void setLoaisach(loaisach loaisach) {
		this.loaisach = loaisach;
	}
}
