package com.poly.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.nhanvienDao;
import com.poly.entity.nhanvien;

@Controller
@Transactional
public class Dangnhap {
	@Autowired
	nhanvienDao dao;
	@Autowired
	SessionFactory factory;
	@Autowired
	HttpSession session;
	@Autowired
	public JavaMailSender emailSender;

	@GetMapping("/admin/login")
	public String logo() {
		return "admin/login";
	}

	@RequestMapping("/admin/logout")
	public String out() {
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/admin/login";
	}

	@PostMapping("/admin/login")
	public String admin(Model model, @RequestParam("tk") String tk, @RequestParam("mk") String mk) {
		List<nhanvien> nv = dao.danhsachadmin();
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
				session.setAttribute("admin", dao.Userad(tk));
				return "redirect:/admin/index";
			} else {
				model.addAttribute("message", "Mật khẩu không trùng khớp!");
				return "admin/login";
			}
		}
		model.addAttribute("message", "Tài khoản không tồn tại!");
		return "admin/login";
	}

	@RequestMapping("admin/quenmatkhau")
	public String quey(Model m) {
		return "admin/quenmatkhau";
	}

	@RequestMapping(value = "/admin/quenmatkhau", method = RequestMethod.POST)
	public String fo(Model m, @RequestParam("tk") String em) {
		List<nhanvien> kh = dao.Userad(em);
		if (kh == null) {
			m.addAttribute("tb", "Email này không tồn tại");
			return "redirect:/admin/quenmatkhau";
		} else {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(kh.get(0).getEmail());
			message.setSubject("Your password");
			message.setText("Welcome to the shop, we are very happy that you have trusted our store\r\n"
					+ "Here is your account and password:" + "Your account name is: " + kh.get(0).getHoten()
					+ "\r\n Your password is: " + kh.get(0).getMatkhau() + "\r\n"
					+ "Quay lại trang này để tiếp tục mua sắm: http://localhost:8080/admin/login");

			// Send Message!

			emailSender.send(message);
			m.addAttribute("message", "Email has been sent!");
			return "redirect:/admin/login";
		}

	}
}
