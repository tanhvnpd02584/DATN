package com.poly.controller.nhanvien;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.dao.loaisachDao;
import com.poly.dao.sachDao;
import com.poly.entity.sach;
import com.poly.service.CommonUtils;

@Controller
@Transactional
public class updatesachCtrl {
	@Autowired
	sachDao dao;
	@Autowired
	loaisachDao ls;

	@RequestMapping("/nhanvien/updatesach/{id}")
	public String action(Model md, @PathVariable("id") int id) {
		md.addAttribute("forms", dao.timId(id));
		md.addAttribute("ls", ls.danhsach());
		return "nhanvien/updatesach";
	}

	@RequestMapping("/nhanvien/updatesach/update")
	public String action(Model md, @ModelAttribute("forms") sach s, @RequestParam("anh") MultipartFile file,
			@RequestParam("ngay") String date) throws ParseException {
		if (file.isEmpty()) {
			SimpleDateFormat sp = new SimpleDateFormat("yyyy-MM-dd");
			Date d = sp.parse(date);
			s.setNgayph(d);
		} else {
			s.setAnhsach(file.getOriginalFilename());
			System.out.println(s.getAnhsach());
			try {
				String path = CommonUtils.IMAGE_FOLDER+"/" + s.getAnhsach();
				file.transferTo(new File(path));
				SimpleDateFormat sp = new SimpleDateFormat("yyyy-MM-dd");
				Date d = sp.parse(date);
				s.setNgayph(d);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dao.capnhat(s);
		md.addAttribute("sa", dao.danhsach());
		return "redirect:/nhanvien/showbooks";
	}
}
