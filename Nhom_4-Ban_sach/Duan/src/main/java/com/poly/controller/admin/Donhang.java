package com.poly.controller.admin;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.donhangDao;

@Controller
@Transactional
public class Donhang {
	@Autowired
	donhangDao dao;

	@RequestMapping("admin/donhangdd")
	public String akso(Model m) {
		m.addAttribute("x", dao.danhsachdd());
		m.addAttribute("a", dao.tongtien());
		return "admin/donhangdd";
	}
}
