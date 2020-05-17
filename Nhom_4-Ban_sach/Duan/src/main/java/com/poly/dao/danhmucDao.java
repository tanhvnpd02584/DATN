package com.poly.dao;

import java.util.List;

import com.poly.entity.danhmuc;

public interface danhmucDao {
	danhmuc timId(int idloai);

	List<danhmuc> danhsach();

	danhmuc them(danhmuc entity);

	void capnhat(danhmuc entity);
	
	List<danhmuc> danhsac(int id);
	
	List<Object[]> thongke();
}
