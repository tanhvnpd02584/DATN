package com.poly.controller.nhanvien;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.khachhangDao;
import com.poly.entity.khachhang;

@Controller
@Transactional
public class profilekhCtrl {
	@Autowired
	khachhangDao dao;
	
	@RequestMapping("/nhanvien/dsprofilekh")
	public String action(Model model) {
		List<khachhang> list = dao.danhsach();
		model.addAttribute("kh", list);
		return "nhanvien/dsprofilekh";
	}
}
