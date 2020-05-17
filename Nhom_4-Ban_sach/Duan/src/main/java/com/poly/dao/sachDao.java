package com.poly.dao;

import java.util.List;

import com.poly.entity.sach;

public interface sachDao {
	sach timId(int idsach);

	List<sach> danhsach();

	sach them(sach entity);

	void capnhat(sach entity);

	sach xoa(int id);

	List<sach> danhsach(int id, int pageNo);

	List<sach> timsach(String ten);

	int getPageCount(int id);

	List<Object[]> inventory();

	int SLsach();
}
