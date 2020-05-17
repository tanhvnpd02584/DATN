package com.poly;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.poly.interceptor.AuthorizeInterceptor;
import com.poly.interceptor.AuthorizeInterceptor2;
import com.poly.interceptor.AuthorizeInterceptor3;

@Configuration
public class InterConfig implements WebMvcConfigurer {
	@Autowired
	AuthorizeInterceptor auth;
	@Autowired
	AuthorizeInterceptor2 auth2;
	@Autowired
	AuthorizeInterceptor3 auth3;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(auth).addPathPatterns("/khachhang/checkout/**", "/khachhang/profile/**",
				"/khachhang/order/**");
		registry.addInterceptor(auth2).addPathPatterns("/nhanvien/index/**", "/nhanvien/profilenv/**",
				"/nhanvien/danhmucsach", "/nhanvien/themdanhmucsach/**", "nhanvien/danhmuccn/**",
				"/nhanvien/donhang/**", "/nhanvien/duyetdh", "/nhanvien/donhangdd", "nhanvien/hdkhach/**",
				"/nhanvien/khuyenmai/**", "/nhanvien/themkhuyenmai/**", "/nhanvien/loaisach/**",
				"/nhanvien/dsprofilekh", "/nhanvien/themloaisach/**", "/nhanvien/updateloai/**",
				"/nhanvien/showbooks/**", "/nhanvien/themsach/**", "/nhanvien/updateprofile/**",
				"/nhanvien/updatesach/**");

		registry.addInterceptor(auth3).addPathPatterns("/admin/profilenv/**", "/admin/showbooks/**",
				"/admin/donhangdd/**", "/admin/donhang/**", "/admin/index", "/admin/dsprofilekh/**", "/admin/report/**",
				"/admin/loaisach", "/admin/danhmucsach/**", "/admin/khuyenmai/**", "/admin/xoasach/**",
				"/admin/updatesach/**", "/admin/cnnhanvien/**", "/admin/xoanhanvien/**", "/admin/capnhatnv/**",
				"/admin/danhsachnv/**", "/admin/updateprofilenv/**", "/admin/hdkhach/**", "/admin/taonv/**");
	}
}
