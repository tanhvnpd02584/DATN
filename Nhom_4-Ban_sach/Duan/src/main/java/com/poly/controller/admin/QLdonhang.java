package com.poly.controller.admin;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.chitietDao;
import com.poly.dao.donhangDao;

@Controller
@Transactional
public class QLdonhang {
	@Autowired
	donhangDao dao;
	@Autowired
	chitietDao ct;

	@RequestMapping("admin/donhang/{id}")
	public String chitiet(Model model, @PathVariable("id") int id) {
		model.addAttribute("don", ct.danhsach(id));
		return "admin/chitietdh";
	}

	@RequestMapping("admin/hdkhach/{id}")
	public String lichsu(Model m, @PathVariable("id") int id) {
		m.addAttribute("x", dao.danhsach(id));
		return "admin/hdkhach";
	}
}
