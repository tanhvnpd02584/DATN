package com.poly.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.chitietDao;
import com.poly.dao.donhangDao;
import com.poly.dao.sachDao;
import com.poly.entity.chitiet;
import com.poly.entity.donhang;
import com.poly.entity.item;
import com.poly.entity.khachhang;
import com.poly.entity.sach;

@Controller
@Transactional
public class Dathang {
	@Autowired
	HttpSession session;
	@Autowired
	donhangDao dh;
	@Autowired
	chitietDao dao;
	@Autowired
	chitietDao ss;
	@Autowired
	sachDao s;
	@Autowired
	public JavaMailSender mail;

	@RequestMapping("/khachhang/checkout")
	public String action(Model m) {
		if(session.getAttribute("cart")==null) {
			m.addAttribute("thong","Giỏ hàng trống, vui lòng chọn sản phẩm");
			return "khachhang/cart";
		}
		return "khachhang/checkout";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/khachhang/thanhtoan")
	public String ac() {
		List<item> c = (List<item>) session.getAttribute("cart");
		List<khachhang> k = new ArrayList<khachhang>();
		k = (List<khachhang>) session.getAttribute("hoten");
		donhang bill = new donhang();
		int pri = 0;
		if (c.size() > 0) {
			for (int i = 0; i < c.size(); i++) {
				pri += c.get(i).getGia() * c.get(i).getSoluong();
			}
			Date date = new Date();
			System.out.println(date);
			bill.setKhachhang(k.get(0));
			bill.setNgaydat(date);
			bill.setTong(pri);
			bill.setDiachi(k.get(0).getDiachi());
			bill.setTinhtrangdh(false);
		}
		dh.them(bill);
		for (int i = 0; i < c.size(); i++) {
			chitiet ct = new chitiet();
			sach p = s.timId(c.get(i).getSach().getIdsach());
			p.setSoluong(p.getSoluong() - c.get(i).getSoluong());
			System.out.println(p.getSoluong());
			ct.setDonhang(bill);
			ct.setSach(c.get(i).getSach());
			ct.setDongia(c.get(i).getGia());
			ct.setSoluong(c.get(i).getSoluong());
			ct.setThanhtien(c.get(i).getGia() * c.get(i).getSoluong());
			dao.them(ct);
		}
		for (int i = 0; i < c.size(); i++) {
			pri += c.get(i).getGia() * c.get(i).getSoluong();
		}
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(k.get(0).getEmail());
		message.setSubject("Đơn hàng của bạn");
		message.setText("Chào mừng bạn ghé thăm shop, cảm ơn bạn đã tin tưởng và mua sắm tại shop\r\n"
				+ "Click vào đường link để xem chi tiết đơn hàng bạn đã đặt:"
				+ "http://localhost:8080/khachhang/order/detail/" + bill.getIddonhang() + "\r\n"
				+ "Tổng số tiền bạn phải trả khi nhận hàng: " + pri);

		// Send Message!
		mail.send(message);
		c.clear();

		return "redirect:/khachhang/index";
	}

}
