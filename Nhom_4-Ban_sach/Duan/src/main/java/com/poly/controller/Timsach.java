package com.poly.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.loaisachDao;
import com.poly.dao.sachDao;
import com.poly.entity.sach;

@Controller
@Transactional
public class Timsach {
	@Autowired
	sachDao dao;
	@Autowired
	loaisachDao dao2;

	@RequestMapping("/khachhang/search")
	public String timsach(Model model, @RequestParam("ten") String ten) {
		List<sach> s = dao.timsach(ten);
		model.addAttribute("am", dao2.danhsach(1));
		model.addAttribute("kk", s);
		return "khachhang/shop";
	}
}
