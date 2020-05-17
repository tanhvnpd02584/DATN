package com.poly.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.danhmucDao;
import com.poly.dao.khachhangDao;
import com.poly.dao.loaisachDao;
import com.poly.dao.nhanvienDao;
import com.poly.dao.sachDao;
import com.poly.entity.danhmuc;
import com.poly.entity.nhanvien;

@Controller
@Transactional
public class Admin {
	@Autowired
	danhmucDao dao;
	@Autowired
	khachhangDao dao2;
	@Autowired
	loaisachDao dao3;
	@Autowired
	sachDao dao4;
	@Autowired
	nhanvienDao dao5;
	@Autowired
	HttpSession session;

	@RequestMapping("admin/profilenv")
	public String action() {
		return "admin/profilenv";
	}

	@RequestMapping("admin/showbooks")
	public String sa(Model model) {
		model.addAttribute("sa", dao4.danhsach());
		return "admin/showbooks";
	}

	@RequestMapping("admin/danhmucsach")
	public String danhmuc(Model model) {
		List<danhmuc> list = dao.danhsach();
		model.addAttribute("dm", list);
		return "admin/danhmucsach";
	}

	@RequestMapping("admin/dsprofilekh")
	public String dskhach(Model model) {
		model.addAttribute("kh", dao2.danhsach());
		return "admin/dsprofilekh";
	}

	@RequestMapping("admin/loaisach")
	public String loaisach(Model model) {
		model.addAttribute("ls", dao3.danhsach());
		return "admin/loaisach";
	}

	@RequestMapping("admin/updateprofilenv")
	public String updateAD(Model model) {
		@SuppressWarnings("unchecked")
		List<nhanvien> nv = (List<nhanvien>) session.getAttribute("admin");
		nhanvien n = nv.get(0);
		model.addAttribute("form", n);
		return "admin/updateprofilenv";
	}

	@RequestMapping("/admin/updateprofilenv/update")
	public String update(@ModelAttribute("form") nhanvien nv, Model model) {
		dao5.capnhat(nv);
		session.setAttribute("user", dao5.Userad(nv.getEmail()));
		return "redirect:/admin/index";
	}
}
