package com.poly.controller.admin;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.poly.dao.nhanvienDao;
import com.poly.entity.nhanvien;

@Controller
@Transactional
public class nhanvienCtrl {
	@Autowired
	nhanvienDao dao;

	@RequestMapping("admin/danhsachnv")
	public String ds(Model m) {
		m.addAttribute("kh", dao.danhsachnv());
		return "admin/danhsachnv";
	}

	@RequestMapping("admin/cnnhanvien/{id}")
	public String cn(Model m, @PathVariable("id") int id) {
		m.addAttribute("form", dao.timId(id));
		return "admin/updateprofilenv";
	}

	@RequestMapping("admin/xoanhanvien/{id}")
	public String xoa(Model m, @PathVariable("id") int id) {
		dao.xoa(id);
		m.addAttribute("kh", dao.danhsachnv());
		return "redirect:/admin/danhsachnv";
	}

	@RequestMapping("admin/capnhatnv")
	public String cnnv(Model m, @ModelAttribute("form") nhanvien nv) {
		dao.capnhat(nv);
		m.addAttribute("kh", dao.danhsachnv());
		return "redirect:/admin/danhsachnv";
	}

	@RequestMapping("admin/taonv")
	public String tao(Model m) {
		m.addAttribute("form", new nhanvien());
		return "admin/taonv";
	}

	@RequestMapping(value = "admin/taonv", method = RequestMethod.POST)
	public String taonv(@ModelAttribute("form") nhanvien n, Model m) {
		int c = 0;
		for (int i = 0; i < dao.danhsachnv().size(); i++) {
			if (n.getEmail().equals(dao.danhsachnv().get(i).getEmail())) {
				c++;
			}
		}
		if (c == 0) {
			n.setQuyen(false);
			dao.them(n);
			m.addAttribute("kh", dao.danhsachnv());
			return "redirect:/admin/danhsachnv";
		} else {
			m.addAttribute("tb", "Email này đã tồn tại");
			return "admin/taonv";
		}
	}
}
