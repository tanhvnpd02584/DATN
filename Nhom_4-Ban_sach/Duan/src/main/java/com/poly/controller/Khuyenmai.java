package com.poly.controller;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.khuyenmaiDao;

@Controller
@Transactional
public class Khuyenmai {
	@Autowired
	khuyenmaiDao dao;

	@RequestMapping("/khachhang/sale-off")
	public String km(Model model) {
		model.addAttribute("ds", dao.danhsach());
		return "khachhang/sale-off";
	}
}
