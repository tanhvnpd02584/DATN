package com.poly.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.chitietDao;
import com.poly.dao.donhangDao;
import com.poly.entity.khachhang;
import com.poly.entity.sach;

@Controller
@Transactional
public class Order {
	@Autowired
	donhangDao dao;
	@Autowired
	chitietDao ct;
	@Autowired
	HttpSession ss;

	@SuppressWarnings({ "unchecked" })
	@RequestMapping("/khachhang/order")
	public String ac(Model model) {
		List<khachhang> kh = (List<khachhang>) ss.getAttribute("hoten");
		khachhang khach = kh.get(0);
		model.addAttribute("don", dao.danhsach(khach.getIdkhach()));
		return "khachhang/order";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/khachhang/order/cancel/{id}")
	public String xoa(Model model, @PathVariable("id") int id) {
		for (int i = 0; i < ct.danhsach(id).size(); i++) {
			sach s = ct.danhsach(id).get(i).getSach();
			s.setSoluong(ct.danhsach(id).get(i).getSoluong() + s.getSoluong());
		}
		ct.xoa(id);
		dao.huy(id);
		List<khachhang> kh = (List<khachhang>) ss.getAttribute("hoten");
		khachhang khach = kh.get(0);
		model.addAttribute("don", dao.danhsach(khach.getIdkhach()));
		return "redirect:/khachhang/order";
	}

	@RequestMapping("khachhang/order/detail/{id}")
	public String chitiet(Model model, @PathVariable("id") int id) {
		model.addAttribute("don", ct.danhsach(id));
		return "khachhang/order-details";
	}
}
