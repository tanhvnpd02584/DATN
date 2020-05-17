package com.poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.danhmucDao;
import com.poly.dao.loaisachDao;
import com.poly.dao.sachDao;
import com.poly.entity.danhmuc;
import com.poly.entity.loaisach;
import com.poly.entity.sach;
import com.poly.service.CartService;

//import com.poly.service.CartService;

@Controller
@Transactional
public class Giohang {
	@Autowired
	CartService cart;
	@Autowired
	sachDao sac;
	@Autowired
	loaisachDao dao;
	@Autowired
	danhmucDao dm;

	@RequestMapping("/khachhang/cart")
	public String a(Model model) {
		return "khachhang/cart";
	}

	@RequestMapping("khachhang/cart/add/{id}")
	public String add(@PathVariable("id") int id, Model model) {
		cart.add(id);
		sach s = sac.timId(id);
		List<loaisach> ls = dao.danhsacha(s.getLoaisach().getIdloai());
		danhmuc d = dm.timId(ls.get(0).getDanhmuc().getIddanhmuc());
		List<loaisach> ds = dao.danhsach(d.getIddanhmuc());
		model.addAttribute("kk", sac.danhsach(ls.get(0).getIdloai(), 0));
		model.addAttribute("am", ds);
		return "redirect:/khachhang/shop/" + d.getIddanhmuc();
	}

	@RequestMapping("/khachhang/cart/remove/{id}")
	public String remove(@PathVariable("id") int id) {
		cart.remove(id);
		return "redirect:/khachhang/cart";
	}

	@RequestMapping("/khachhang/cart/update")
	public String update(HttpServletRequest request) {
		List<sach> l = new ArrayList<sach>();
		sach list = new sach();
		for (int i = 0; i < cart.getItems().size(); i++) {
			list = cart.getItems().get(i).getSach();
			l.add(list);
		}
		for (sach p : l) {
			String id = String.valueOf(p.getIdsach());
			int qty = Integer.parseInt(request.getParameter(id));
			cart.update(p.getIdsach(), qty);
		}

		return "redirect:/khachhang/cart";
	}

	@RequestMapping("/khachhang/cart/clear")
	public String clear() {
		cart.clear();
		return "/khachhang/index";
	}

}
