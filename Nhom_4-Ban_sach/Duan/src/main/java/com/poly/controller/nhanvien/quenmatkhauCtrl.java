package com.poly.controller.nhanvien;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.chitietDao;
import com.poly.dao.donhangDao;
import com.poly.dao.nhanvienDao;
import com.poly.entity.khachhang;
import com.poly.entity.nhanvien;
import com.poly.entity.sach;

@Controller
@Transactional
public class quenmatkhauCtrl {
	@Autowired
	nhanvienDao dao;
	@Autowired
	donhangDao d;
	@Autowired
	chitietDao ct;
	@Autowired
	public JavaMailSender s;

	@RequestMapping("/nhanvien/quenmatkhau")
	public String action() {
		return "nhanvien/quenmatkhau";
	}

	@RequestMapping(value = "/nhanvien/quenmatkhau", method = RequestMethod.POST)
	public String fo(Model m, @RequestParam("tk") String em) {
		List<nhanvien> kh = dao.User(em);
		if (kh == null) {
			m.addAttribute("tb", "Email này không tồn tại");
			return "redirect:/nhanvien/quenmatkhau";
		} else {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(kh.get(0).getEmail());
			message.setSubject("Your password");
			message.setText("Welcome to the shop, we are very happy that you have trusted our store\r\n"
					+ "Here is your account and password:" + "Your account name is: " + kh.get(0).getHoten()
					+ "\r\n Your password is: " + kh.get(0).getMatkhau() + "\r\n"
					+ "Quay lại trang này để tiếp tục: http://localhost:8080/nhanvien/login");

			// Send Message!

			s.send(message);
			m.addAttribute("message", "Email has been sent!");
			return "redirect:/nhanvien/login";
		}

	}

	@RequestMapping("/nhanvien/xoadon/{id}")
	public String xoa(Model model, @PathVariable("id") int id) {
		khachhang kh = d.timId(id).getKhachhang();
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(kh.getEmail());
		message.setSubject("Your password");
		message.setText("Chào mừng bạn đến với shop, shop rất vui vì bạn đã tin cậy và đặt hàng \r\n"
				+ "Đơn hàng của bạn đã hủy do kho không còn sản phẩm này \r\n"
				+ "Quay lại trang này để tiếp tục mua sắm: http://localhost:8080/khachhang/index");
		// Send Message!
		for (int i = 0; i < ct.danhsach(id).size(); i++) {
			sach s = ct.danhsach(id).get(i).getSach();
			s.setSoluong(ct.danhsach(id).get(i).getSoluong() + s.getSoluong());
		}
		s.send(message);
		ct.xoa(id);
		d.huy(id);
		model.addAttribute("x", d.danhsachdg());
		return "redirect:/nhanvien/donhang";
	}

}
