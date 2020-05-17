package com.poly.dao;

import java.util.List;

import com.poly.entity.khuyenmai;

public interface khuyenmaiDao {
	khuyenmai timId(int idloai);

	List<khuyenmai> danhsach();
	
	List<khuyenmai> danhsachkm();

	khuyenmai them(khuyenmai entity);

	void capnhat(khuyenmai entity);

	khuyenmai xoa(int id);

	List<khuyenmai> timIdsach(int id);
}
