package com.poly.controller;

import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;

import com.poly.dao.khachhangDao;
import com.poly.entity.khachhang;

@Controller
@Transactional
public class Taikhoan {
	@Autowired
	khachhangDao dao;
	@Autowired
	public JavaMailSender emailSender;
	@Autowired
	SessionFactory factory;
	@Autowired
	HttpSession session;

	@RequestMapping("/khachhang/login")
	public String action(ModelMap model) {
		return "khachhang/login";
	}

	@RequestMapping("/khachhang/register")
	public String resgis(Model model) {
		khachhang kh = new khachhang();
		model.addAttribute("form", kh);
		return "khachhang/register";
	}

	@RequestMapping(value = "/khachhang/dangky", method = RequestMethod.POST)
	public String regis(Model model, @Validated @ModelAttribute("form") khachhang kh, BindingResult errors) {
		List<khachhang> khach = dao.danhsach();
		if (errors.hasErrors()) {
			model.addAttribute("message", "Sữa các lỗi dưới đây");
		} else {
			int c = 0;
			for (int i = 0; i < khach.size(); i++) {
				if (kh.getEmail().equals(khach.get(i).getEmail())) {
					c++;
				}
			}
			if (c == 0) {
				dao.them(kh);
				model.addAttribute("message", "Đăng ký thành công");
				return "khachhang/register";
			} else {
				model.addAttribute("message", "Email này đã đăng ký!");
				return "khachhang/register";
			}
		}
		return "khachhang/register";
	}

	@RequestMapping("/khachhang/logout")
	public String out() {
		if (session != null) {
			session.removeAttribute("hoten");
		}
		return "redirect:/khachhang/index";
	}

	@RequestMapping(value = "/khachhang/login", method = RequestMethod.POST)
	public String action(Model model, @RequestParam("taikhoan") String tk, @RequestParam("matkhau") String mk) {
		List<khachhang> cus = dao.danhsach();
		int count = 0;
		int c = 0;
		for (int i = 0; i < cus.size(); i++) {
			if (tk.equals(cus.get(i).getEmail())) {
				count++;
			}
			if (mk.equals(cus.get(i).getMatkhau())) {
				c++;
			}
		}
		if (count == 1) {
			if (c != 0) {
				session.setAttribute("hoten", dao.User(tk));
				return "redirect:/khachhang/index";
			} else {
				model.addAttribute("message", "Mật khẩu không đúng");
				return "khachhang/login";
			}
		}
		model.addAttribute("message", "Email này chưa đăng ký");
		return "khachhang/login";
	}

	@RequestMapping(value = "/khachhang/forget", method = RequestMethod.GET)
	public String forget() {
		return "khachhang/forget";
	}

	@RequestMapping(value = "/khachhang/forget", method = RequestMethod.POST)
	public String forget(Model model, @RequestParam("taikhoan") String email) {
		List<khachhang> kh = dao.User(email);
		if (kh == null) {
			model.addAttribute("tb", "Email này không tồn tại");
		} else {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(kh.get(0).getEmail());
			message.setSubject("Your password");
			message.setText("Welcome to the shop, we are very happy that you have trusted our store\r\n"
					+ "Here is your account and password:" + "Your account name is: " + kh.get(0).getHoten()
					+ "Your password is: " + kh.get(0).getMatkhau());

			// Send Message!
			emailSender.send(message);
			model.addAttribute("message", "Email has been sent!");
			return "redirect:/khachhang/login";
		}
		return "khachhang/forget";
	}

	@Bean
	public static JavaMailSender getJavaMailSender() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);

		mailSender.setUsername("dattq201098@gmail.com");
		mailSender.setPassword("Quocdat201098");

		Properties props = mailSender.getJavaMailProperties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.debug", "true");

		return mailSender;
	}

	@RequestMapping(value = "/khachhang/profile", method = RequestMethod.GET)
	public String pr(Model model) {
		@SuppressWarnings("unchecked")
		List<khachhang> k = (List<khachhang>) session.getAttribute("hoten");
		khachhang khach = k.get(0);
		model.addAttribute("forms", khach);
		return "khachhang/profile";
	}

	@RequestMapping("/khachhang/profile/update")
	public String uppr(@ModelAttribute("forms") khachhang khach) {
		dao.capnhat(khach);
		session.setAttribute("hoten", dao.User(khach.getEmail()));
		return "redirect:/khachhang/profile";
	}
}
