package com.poly.controller.admin;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.khuyenmaiDao;
import com.poly.dao.sachDao;
import com.poly.entity.khuyenmai;

@Controller
@Transactional
public class KhuyenmaiAD {
	@Autowired
	khuyenmaiDao dao;
	@Autowired
	sachDao s;

	@RequestMapping("/admin/khuyenmai")
	public String action(Model model) {
		List<khuyenmai> list = dao.danhsachkm();
		model.addAttribute("km", list);
		return "admin/khuyenmai";
	}

	@RequestMapping("admin/khuyenmai/xoa/{id}")
	public String xoai(Model m, @PathVariable("id") int id) {
		dao.xoa(id);
		m.addAttribute("km", dao.danhsach());
		return "redirect:/admin/khuyenmai";
	}

	@RequestMapping("/admin/khuyenmai/{id}")
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
		return "redirect:/admin/khuyenmai";
	}

}
