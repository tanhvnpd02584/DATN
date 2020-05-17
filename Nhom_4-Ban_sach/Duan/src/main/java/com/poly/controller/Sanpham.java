package com.poly.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.danhmucDao;
import com.poly.dao.khuyenmaiDao;
import com.poly.dao.loaisachDao;
import com.poly.dao.sachDao;
import com.poly.entity.danhmuc;
import com.poly.entity.loaisach;
import com.poly.entity.sach;

@Controller
@Transactional
public class Sanpham {
	@Autowired
	SessionFactory factory;
	@Autowired
	loaisachDao dao;
	@Autowired
	sachDao sac;
	@Autowired
	danhmucDao dm;
	@Autowired
	HttpSession ss;
	@Autowired
	khuyenmaiDao k;

	@RequestMapping("/khachhang/details/{ten}/{id}")
	public String detail(Model model, @PathVariable("id") int id) {
		sach sach = sac.timId(id);
		model.addAttribute("kk", sach);
		model.addAttribute("khuyen",k.danhsach());
		return "khachhang/product-details";
	}

	@RequestMapping("/khachhang/shop/{id}")
	public String c(Model mdeo, @PathVariable("id") int id) {
		List<loaisach> loai = dao.danhsach(id);
		List<sach> s = sac.danhsach(loai.get(0).getIdloai(), 0);
		mdeo.addAttribute("kk", s);
		mdeo.addAttribute("am", loai);
		return "khachhang/shop";
	}

	@RequestMapping("/khachhang/shop/{id}/{tenloai}/{page}")
	public String cmj(Model mdeo, @PathVariable("id") int id, @PathVariable("page") int pageNo) {
		List<loaisach> loai = dao.danhsach(id);
		if (pageNo >= sac.getPageCount(loai.get(0).getIdloai())) {
			pageNo = 0;
		} else if (pageNo < 0) {
			pageNo = sac.getPageCount(loai.get(0).getIdloai()) - 1;
		}
		mdeo.addAttribute("pageNo", pageNo);
		mdeo.addAttribute("lastPageNo", sac.getPageCount(loai.get(0).getIdloai()) - 1);
		List<sach> s = sac.danhsach(loai.get(0).getIdloai(), pageNo);
		mdeo.addAttribute("kk", s);
		mdeo.addAttribute("am", loai);
		return "khachhang/shop";
	}

	@RequestMapping("/khachhang/last/{danhmuc}/{theloai}/{name}")
	public String action(Model model, @PathVariable("name") int id) {
		List<loaisach> ls = dao.danhsacha(id);
		danhmuc d = dm.timId(ls.get(0).getDanhmuc().getIddanhmuc());
		List<loaisach> ds = dao.danhsach(d.getIddanhmuc());
		model.addAttribute("kk", sac.danhsach(ls.get(0).getIdloai(), 0));
		model.addAttribute("am", ds);
		return "khachhang/shop";
	}

	@RequestMapping("/khachhang/last/{danhmuc}/{theloai}/{name}/{pageNo}")
	public String action(Model model, @PathVariable("name") int id, @PathVariable("pageNo") int pageNo) {
		List<loaisach> ls = dao.danhsacha(id);
		if (pageNo >= sac.getPageCount(ls.get(0).getIdloai())) {
			pageNo = 0;
		} else if (pageNo < 0) {
			pageNo = sac.getPageCount(ls.get(0).getIdloai()) - 1;
		}
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("lastPageNo", sac.getPageCount(ls.get(0).getIdloai()) - 1);
		danhmuc d = dm.timId(ls.get(0).getDanhmuc().getIddanhmuc());
		List<loaisach> ds = dao.danhsach(d.getIddanhmuc());
		model.addAttribute("kk", sac.danhsach(ls.get(0).getIdloai(), pageNo));
		model.addAttribute("am", ds);
		return "khachhang/shop";
	}

//	@RequestMapping("/admin/index")
//	public String s() {
//		return "admin/index";
//	}
}
