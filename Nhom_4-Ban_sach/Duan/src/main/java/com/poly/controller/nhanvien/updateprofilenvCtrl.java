package com.poly.controller.nhanvien;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.nhanvienDao;
import com.poly.entity.nhanvien;


@Controller
@Transactional
public class updateprofilenvCtrl {
	@Autowired
	nhanvienDao dao;
	@Autowired
	HttpSession session;

	@SuppressWarnings("unchecked")
	@RequestMapping("/nhanvien/updateprofilenv")
	public String update(Model model) {
		List<nhanvien> nv = (List<nhanvien>) session.getAttribute("user");
		nhanvien n = nv.get(0);
		model.addAttribute("forms", n);
		return "nhanvien/updateprofilenv";
	}

	@RequestMapping("/nhanvien/updateprofilenv/update")
	public String update(@ModelAttribute("forms") nhanvien nv,Model model) {
		dao.capnhat(nv);
		session.setAttribute("user", dao.User(nv.getEmail()));
		return "redirect:/nhanvien/index";
	}

}
