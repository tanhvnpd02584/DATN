package com.poly.controller.nhanvien;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.poly.dao.danhmucDao;
import com.poly.entity.danhmuc;

@Controller
@Transactional
public class danhmucsachCtrl {
	@Autowired
	danhmucDao dao;

	@RequestMapping("/nhanvien/danhmucsach")
	public String action(Model model) {
		List<danhmuc> list = dao.danhsach();
		model.addAttribute("dm", list);
		return "nhanvien/danhmucsach";
	}

	@RequestMapping("nhanvien/themdanhmucsach")
	public String in(Model m) {
		m.addAttribute("form", new danhmuc());
		return "nhanvien/themdanhmucsach";
	}

	@RequestMapping(value =  "nhanvien/themdanhmucsach", method = RequestMethod.POST)
	public String d(@ModelAttribute("form") danhmuc dm, Model m) {
		int c = 0;
		for (int i = 0; i < dao.danhsach().size(); i++) {
			if (dm.getTendanhmuc().equals(dao.danhsach().get(i).getTendanhmuc())) {
				c++;
			}
		}
		if (c == 0) {
			dao.them(dm);
			List<danhmuc> list = dao.danhsach();
			m.addAttribute("dm", list);
			return "redirect:/nhanvien/danhmucsach";
		} else {
			m.addAttribute("tb", "Tên danh mục đã có");
			return "nhanvien/themdanhmucsach";
		}
	}

	@RequestMapping("nhanvien/danhmuccn/{id}")
	public String cn(Model m, @PathVariable("id") int id) {
		danhmuc danhmuc = dao.timId(id);
		m.addAttribute("form", danhmuc);
		return "nhanvien/danhmuccn";
	}

	@RequestMapping(value = "nhanvien/danhmuccn", method = RequestMethod.POST)
	public String cn(@ModelAttribute("form") danhmuc dm, Model m) {
			dao.capnhat(dm);
			List<danhmuc> list = dao.danhsach();
			m.addAttribute("dm", list);
			return "redirect:/nhanvien/danhmucsach";
	}
}
