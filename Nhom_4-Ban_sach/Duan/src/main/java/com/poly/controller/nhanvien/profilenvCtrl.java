package com.poly.controller.nhanvien;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.chitietDao;
import com.poly.dao.sachDao;

@Controller
@Transactional
public class profilenvCtrl {
	@Autowired
	chitietDao dao;
	@Autowired
	sachDao dao2;
	@Autowired
	HttpSession session;

	@RequestMapping("/nhanvien/profilenv")
	public String action() {
		return "nhanvien/profilenv";
	}

	@RequestMapping("/nhanvien/logout")
	public String ouut() {
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/nhanvien/login";
	}

	@RequestMapping("/nhanvien/index")
	public String actio(ModelMap m) {
		m.addAttribute("slsach", dao2.SLsach());
		m.addAttribute("slsachban", dao.SLsachban());
		m.addAttribute("dt", dao.SLdonhang());
		m.addAttribute("slkhach", dao.SLkhach());
		m.addAttribute("data", dao.revenuKhach());
		return "nhanvien/index";
	}
}
