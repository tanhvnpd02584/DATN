package com.poly.controller.admin;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.chitietDao;
import com.poly.dao.sachDao;

@Controller
@Transactional
public class Index {
	@Autowired
	chitietDao dao;
	@Autowired
	sachDao dao2;

	@RequestMapping("admin/index")
	public String index(Model m) {
		m.addAttribute("slsach", dao2.SLsach());
		m.addAttribute("slsachban", dao.SLsachban());
		m.addAttribute("dt", dao.SLdonhang());
		m.addAttribute("slkhach", dao.SLkhach());
		m.addAttribute("data", dao.revenuKhach());
		return "admin/index";
	}
}
