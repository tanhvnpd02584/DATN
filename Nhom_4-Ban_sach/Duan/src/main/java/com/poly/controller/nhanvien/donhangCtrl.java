package com.poly.controller.nhanvien;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.chitietDao;
import com.poly.dao.donhangDao;
import com.poly.entity.donhang;

@Controller
@Transactional
public class donhangCtrl {
	@Autowired
	donhangDao dao;
	@Autowired
	chitietDao ct;

	@RequestMapping("/nhanvien/duyetdh")
	public String action() {
		return "nhanvien/duyetdh";
	}

	@RequestMapping("/nhanvien/donhang")
	public String action2(Model model) {
		model.addAttribute("x", dao.danhsachdg());
		return "nhanvien/donhang";
	}

	@RequestMapping("nhanvien/donhang/{id}")
	public String chitiet(Model model, @PathVariable("id") int id) {
		model.addAttribute("don", ct.danhsach(id));
		return "nhanvien/chitietdh";
	}

	@RequestMapping("nhanvien/donhangdd")
	public String d(Model m) {
		m.addAttribute("x", dao.danhsachdd());
		return "nhanvien/donhangdd";
	}

	@RequestMapping("nhanvien/hdkhach/{id}")
	public String lichsu(Model m, @PathVariable("id") int id) {
		m.addAttribute("ls", dao.danhsach(id));
		return "nhanvien/hdkhach";
	}

	@RequestMapping("nhanvien/donhang/update/{id}")
	public String cnDonhang(Model m, @PathVariable("id") int id) {
		donhang d = dao.timId(id);
		d.setTinhtrangdh(true);
		m.addAttribute("x", dao.danhsachdg());
		return "redirect:/nhanvien/donhang";
	}
}
