package com.poly.controller.nhanvien;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.poly.dao.danhmucDao;
import com.poly.dao.loaisachDao;
import com.poly.entity.loaisach;

@Controller
@Transactional
public class loaisachCtrl {
	@Autowired
	loaisachDao dao;
	@Autowired
	danhmucDao d;

	@RequestMapping("/nhanvien/loaisach")
	public String action(Model model) {
		model.addAttribute("ls", dao.danhsach());
		return "nhanvien/loaisach";
	}

	@RequestMapping("/nhanvien/updateloai/{id}")
	public String a(Model m, @PathVariable("id") int id) {
		m.addAttribute("h", d.danhsach());
		m.addAttribute("form", dao.timId(id));
		return "nhanvien/updateloai";
	}

	@RequestMapping("/nhanvien/updateloai")
	public String up(Model m, @ModelAttribute("form") loaisach l) {
		dao.capnhat(l);
		m.addAttribute("ls", dao.danhsach());
		return "redirect:/nhanvien/loaisach";
	}

	@RequestMapping("/nhanvien/themloaisach")
	public String a(Model m) {
		m.addAttribute("h", d.danhsach());
		m.addAttribute("form", new loaisach());
		return "nhanvien/themloaisach";
	}

	@RequestMapping(value = "/nhanvien/themloaisach", method = RequestMethod.POST)
	public String them(Model m, @ModelAttribute("form") loaisach l) {
		int c = 0;
		for (int i = 0; i < dao.danhsach().size(); i++) {
			if (l.getTenloai().equals(dao.danhsach().get(i).getTenloai())) {
				c++;
			}
		}
		if (c != 0) {
			m.addAttribute("tb", "Tên loại sách đã tồn tại!");
			return "nhanvien/themloaisach";
		} else {
			dao.them(l);
			m.addAttribute("ls", dao.danhsach());
			return "redirect:/nhanvien/loaisach";
		}
	}
}
