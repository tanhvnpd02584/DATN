package com.poly.controller.admin;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.chitietDao;
import com.poly.dao.danhmucDao;
import com.poly.dao.sachDao;

@Controller
@Transactional
public class Thongkesach {
	@Autowired
	sachDao dao;
	@Autowired
	danhmucDao dao2;
	@Autowired
	chitietDao dao3;

	@RequestMapping("admin/report/inventory")
	public String inventory(Model m) {
		m.addAttribute("data", dao.inventory());
		m.addAttribute("dt", dao2.thongke());
		return "admin/report/inventory";
	}

	@RequestMapping("admin/report/revenu")
	public String revenu(Model m) {
		m.addAttribute("ya", dao3.tkNam());
		m.addAttribute("data", dao3.revenuKhach());
		return "admin/report/revenu";
	}

	@RequestMapping("admin/report/search")
	public String revenu(Model m, @RequestParam("year") int year) {
		m.addAttribute("ya", dao3.tkNam());
		m.addAttribute("data", dao3.revenuNam(year));
		return "admin/report/revenu";
	}

	@RequestMapping("admin/report/revenu/{year}-{month}")
	public String revenuMonth(Model m, @PathVariable("month") int month, @PathVariable("year") int year) {
		m.addAttribute("data", dao3.revenuThang(year, month));
		return "admin/report/revenuMonth";
	}

	@RequestMapping("admin/report/revenuDay/{day}")
	public String revenuDay(Model m, @PathVariable("day") String d) {
		m.addAttribute("data", dao3.revenu(d));
		return "admin/report/revenuDay";
	}
}
