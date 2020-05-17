package com.poly.dao;

import java.util.List;

import com.poly.entity.khachhang;

public interface khachhangDao {
	khachhang timId(String email);
	List<khachhang> danhsach();
	khachhang them(khachhang entity);
	void capnhat(khachhang entity);
	List<khachhang> User(String email);
}
