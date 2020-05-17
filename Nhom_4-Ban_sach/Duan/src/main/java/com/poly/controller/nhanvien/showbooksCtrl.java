package com.poly.controller.nhanvien;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.sachDao;

@Controller
@Transactional
public class showbooksCtrl {
	@Autowired
	sachDao dao;
	@RequestMapping("/nhanvien/showbooks")
	public String action(Model model) {
		model.addAttribute("sa", dao.danhsach());
		return "nhanvien/showbooks";
	}
}
