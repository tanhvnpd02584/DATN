package com.poly.controller.nhanvien;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.khuyenmaiDao;
import com.poly.dao.sachDao;
import com.poly.entity.khuyenmai;

@Controller
@Transactional
public class khuyenmaiCtrl {
	@Autowired
	khuyenmaiDao dao;
	@Autowired
	sachDao s;

	@RequestMapping("/nhanvien/khuyenmai")
	public String action(Model model) {
		List<khuyenmai> list = dao.danhsachkm();
		model.addAttribute("km", list);
		return "nhanvien/khuyenmai";
	}

	@RequestMapping("/nhanvien/khuyenmai/{id}")
	public String action(Model model, @PathVariable("id") int id) {
		khuyenmai km = dao.timId(id);
		if (km.isTrangthai() == true) {
			km.setTrangthai(false);
		} else {
			for (int i = 0; i < dao.danhsach().size(); i++) {
				if (km.getSach().getIdsach() == dao.danhsach().get(i).getSach().getIdsach()) {
					for (int j = 0; j < dao.timIdsach(km.getSach().getIdsach()).size(); j++) {
						dao.timIdsach(km.getSach().getIdsach()).get(j).setTrangthai(false);
					}
				}
			}
			km.setTrangthai(true);
		}
		model.addAttribute("km", dao.danhsachkm());
		return "redirect:/nhanvien/khuyenmai";
	}

	@RequestMapping("/nhanvien/khuyenmai/update/{id}")
	public String up(Model m, @PathVariable("id") int id) {
		m.addAttribute("form", dao.timId(id));
		return "nhanvien/updatekm";
	}

	@RequestMapping("/nhanvien/khuyenmai/update")
	public String up(Model m, @ModelAttribute("form") khuyenmai km) {
		dao.capnhat(km);
		m.addAttribute("km", dao.danhsachkm());
		return "redirect:/nhanvien/khuyenmai";
	}

	@RequestMapping("/nhanvien/themkhuyenmai")
	public String add(Model m) {
		m.addAttribute("form", new khuyenmai());
		m.addAttribute("s", s.danhsach());
		return "nhanvien/themkhuyenmai";
	}

	@RequestMapping("/nhanvien/themkhuyenmai/them")
	public String add(Model m, @ModelAttribute("form") khuyenmai km) {
		for (int i = 0; i < dao.danhsach().size(); i++) {
			if (km.getSach().getIdsach() == dao.danhsach().get(i).getSach().getIdsach()) {
				for (int j = 0; j < dao.timIdsach(km.getSach().getIdsach()).size(); j++) {
					dao.timIdsach(km.getSach().getIdsach()).get(j).setTrangthai(false);
				}
			}
		}
		dao.them(km);
		m.addAttribute("km", dao.danhsachkm());
		return "redirect:/nhanvien/khuyenmai";
	}
}
