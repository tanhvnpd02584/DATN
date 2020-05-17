package com.poly.dao;

import java.util.List;

import com.poly.entity.donhang;

public interface donhangDao {
	donhang timId(int idloai);

	List<donhang> danhsach(int id);

	donhang them(donhang entity);

	void capnhat(donhang entity);

	donhang huy(int iddon);

	List<donhang> danhsachdg();

	List<donhang> danhsachdd();

	public int tongtien();
}
