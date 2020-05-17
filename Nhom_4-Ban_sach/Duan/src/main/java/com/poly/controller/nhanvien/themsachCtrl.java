
package com.poly.controller.nhanvien;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.dao.danhmucDao;
import com.poly.dao.sachDao;
import com.poly.entity.sach;

@Controller
public class themsachCtrl {
	@Autowired
	sachDao dao;
	@Autowired
	ServletContext app;
	@Autowired
	danhmucDao dm;
	@Autowired
	HttpSession session;

	@GetMapping("/nhanvien/themsach")
	public String ac(Model model) {
		model.addAttribute("dm", dm.danhsach());
		model.addAttribute("form", new sach());
		return "nhanvien/themsach";
	}

	@PostMapping("/nhanvien/themsach")
	public String action(Model md, @ModelAttribute("form") sach s, @RequestParam("anh") MultipartFile file,
			@RequestParam("ngay") String date) throws ParseException {
		if (file.isEmpty()) {
			s.setAnhsach("sach.jpg");
			SimpleDateFormat sp = new SimpleDateFormat("yyyy-MM-dd");
			Date d = sp.parse(date);
			s.setNgayph(d);
		} else {
			s.setAnhsach(file.getOriginalFilename());
			try {
				String path = "C:/Users/Admin/eclipse-workspace/Duan/src/main/resources/static/Images/"
						+ s.getAnhsach();
				file.transferTo(new File(path));
				SimpleDateFormat sp = new SimpleDateFormat("yyyy-MM-dd");
				Date d = sp.parse(date);
				s.setNgayph(d);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dao.them(s);
		md.addAttribute("sa", dao.danhsach());
		return "redirect:/nhanvien/showbooks";
	}

}
