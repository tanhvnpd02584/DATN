package com.poly.dao;

import java.util.List;

import com.poly.entity.nhanvien;

public interface nhanvienDao {
	nhanvien timId(int idloai);

	List<nhanvien> danhsachnv();

	nhanvien them(nhanvien entity);

	void capnhat(nhanvien entity);
	
	nhanvien xoa(int id);
	
	List<nhanvien> User(String email);
	
	List<nhanvien> danhsachadmin();
	
	List<nhanvien> Userad(String email);
}
