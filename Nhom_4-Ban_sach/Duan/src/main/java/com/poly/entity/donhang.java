package com.poly.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
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
@Table(name = "donhang")
public class donhang {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int iddonhang;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date ngaydat;
	private int tong;
	private boolean tinhtrangdh;
	private String diachi;

	@OneToMany(mappedBy = "donhang")
	List<chitiet> chitiet;

	@ManyToOne
	@JoinColumn(name = "idkhach")
	khachhang khachhang;

	public int getIddonhang() {
		return iddonhang;
	}

	public void setIddonhang(int iddonhang) {
		this.iddonhang = iddonhang;
	}

	public Date getNgaydat() {
		return ngaydat;
	}

	public void setNgaydat(Date ngaydat) {
		this.ngaydat = ngaydat;
	}

	public int getTong() {
		return tong;
	}

	public void setTong(int tong) {
		this.tong = tong;
	}

	public boolean isTinhtrangdh() {
		return tinhtrangdh;
	}

	public void setTinhtrangdh(boolean tinhtrangdh) {
		this.tinhtrangdh = tinhtrangdh;
	}

	public String getDiachi() {
		return diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public List<chitiet> getChitiet() {
		return chitiet;
	}

	public void setChitiet(List<chitiet> chitiet) {
		this.chitiet = chitiet;
	}

	public khachhang getKhachhang() {
		return khachhang;
	}

	public void setKhachhang(khachhang khachhang) {
		this.khachhang = khachhang;
	}

	public donhang(int iddonhang, Date ngaydat, int tong, boolean tinhtrangdh, String diachi,
			List<com.poly.entity.chitiet> chitiet, com.poly.entity.khachhang khachhang) {
		super();
		this.iddonhang = iddonhang;
		this.ngaydat = ngaydat;
		this.tong = tong;
		this.tinhtrangdh = tinhtrangdh;
		this.diachi = diachi;
		this.chitiet = chitiet;
		this.khachhang = khachhang;
	}

	public donhang() {
		super();
		// TODO Auto-generated constructor stub
	}

}
