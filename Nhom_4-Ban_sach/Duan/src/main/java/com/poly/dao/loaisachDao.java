package com.poly.dao;

import java.util.List;

import com.poly.entity.loaisach;

public interface loaisachDao {
	loaisach timId(int idloai);

	List<loaisach> danhsach();

	loaisach them(loaisach entity);

	void capnhat(loaisach entity);

	List<loaisach> danhsach(int iddanhmuc);
	
	List<loaisach> danhsacha(int tenloai);
}
