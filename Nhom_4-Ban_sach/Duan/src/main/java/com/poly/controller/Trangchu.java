package com.poly.controller;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.danhmucDao;
import com.poly.dao.khuyenmaiDao;
import com.poly.dao.sachDao;

@Controller
@Transactional
public class Trangchu {
	@Autowired
	khuyenmaiDao dao3;
	@Autowired
	sachDao sach;
	@Autowired
	HttpSession ss;
	@Autowired
	danhmucDao dao;

	@RequestMapping("/khachhang/index")
	public String acitona(Model model) {
		ss.setAttribute("d", dao.danhsach());
		model.addAttribute("km", dao3.danhsach());
		return "khachhang/index";
	}

//	@RequestMapping("/khachhang/shop")
//	public String aciton(Model model) {
//		model.addAttribute("km", sach.danhsach());
//		return "khachhang/shop";
//	}
	@RequestMapping("/khachhang/contact")
	public String con() {
		return "khachhang/contact";
	}
}
