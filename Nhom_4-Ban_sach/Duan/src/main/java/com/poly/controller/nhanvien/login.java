package com.poly.controller.nhanvien;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.nhanvienDao;
import com.poly.entity.nhanvien;

@Controller
@Transactional
public class login {
	@Autowired
	nhanvienDao dao;
	@Autowired
	SessionFactory factory;
	@Autowired
	HttpSession session;

	@GetMapping("/nhanvien/login")
	public String actin() {
		return "nhanvien/login";
	}

	@PostMapping("/nhanvien/login")
	public String actio(Model model, @RequestParam("tk") String tk, @RequestParam("mk") String mk) {
		List<nhanvien> nv = dao.danhsachnv();
		int count = 0;
		int c = 0;
		for (int i = 0; i < nv.size(); i++) {
			if (tk.equals(nv.get(i).getEmail())) {
				count++;
			}
			if (mk.equals(nv.get(i).getMatkhau())) {
				c++;
			}
		}
		if (count == 1) {
			if (c == 1) {
				session.setAttribute("user", dao.User(tk));

				return "redirect:/nhanvien/index";
			} else {
				model.addAttribute("message", "Mật khẩu không trùng khớp!");
				return "nhanvien/login";
			}
		}
		model.addAttribute("message", "Tài khoản không tồn tại!");
		return "nhanvien/login";
	}
}
