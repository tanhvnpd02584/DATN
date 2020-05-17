package com.poly.dao;

import java.util.List;

import com.poly.entity.chitiet;

public interface chitietDao {
	chitiet timId(int id);

	List<chitiet> danhsach(int id);

	chitiet them(chitiet entity);

	void capnhat(chitiet entity);

	chitiet xoa(int id);

	int SLsachban();

	int SLkhach();
	
	List<Object[]> tkNam();
	
	List<Object[]> revenuNam(int year);

	List<Object[]> SLdonhang();

	List<Object[]> revenu(String date);

	List<Object[]> revenuKhach();

	List<Object[]> revenuThang(int year, int month);
}
