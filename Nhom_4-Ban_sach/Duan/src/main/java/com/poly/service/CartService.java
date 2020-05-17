package com.poly.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.poly.dao.khuyenmaiDao;
import com.poly.dao.sachDao;
import com.poly.entity.item;
import com.poly.entity.sach;

@SessionScope
@Service
public class CartService {
	@Autowired
	sachDao dao;
	@Autowired
	khuyenmaiDao dao2;
	@Autowired
	HttpSession session;
	List<item> items = new ArrayList<>();
	List<sach> ite = new ArrayList<>();

	@SuppressWarnings("unchecked")
	public void add(int id) {
//		for (sach item : items) {
//			if (item.getIdsach() == id) {
//				item.setSoluong(item.getSoluong() + 1);
//				return;
//			}
//		}
		sach p = dao.timId(id);
		if (session.getAttribute("cart") == null) {
			item i = new item();
			int c = 0;
			for (int j = 0; j < dao2.danhsach().size(); j++) {
				if (p.getIdsach() == dao2.danhsach().get(j).getSach().getIdsach()) {
					for (int k = 0; k < dao2.timIdsach(id).size(); k++) {
						if (dao2.timIdsach(id).get(k).isTrangthai() == true) {
							c++;
						}
					}
				} else {
					i.setGia(p.getGia());
				}
			}
			if (c > 0) {
				i.setGia(p.getGia() - p.getGia() * p.getKhuyenmai().get(0).getGiamphantram() / 100);
			} else {
				i.setGia(p.getGia());
			}
			i.setSach(p);
			i.setSoluong(1);
			items.add(i);
			session.setAttribute("cart", items);
		} else {
			int qt = 1;
			items = (List<item>) session.getAttribute("cart");
			boolean check = false;
			for (item i : items) {
				if (i.getSach().getIdsach() == p.getIdsach()) {
					i.setSoluong(i.getSoluong() + qt);
					check = true;
				}
			}
			if (check == false) {
				item i = new item();
				i.setSoluong(qt);
				i.setGia(p.getGia());
				i.setSach(p);
				items.add(i);
			}
			session.setAttribute("cart", items);
		}

//		item i = new item();
//		i.setGia(p.getGia());
//		System.out.println(i.getGia());
//		i.setSoluong(1);
//		i.setSach(p);
//		items.add(i);
	}

	public void remove(int id) {
		for (item item : items) {
			if (item.getSach().getIdsach() == id) {
				items.remove(item);
				return;
			}
		}
	}

	public void update(Integer id, int qty) {
		for (item item : items) {
			if (item.getSach().getIdsach() == id.intValue()) {
				item.setSoluong(qty);
				return;
			}
		}
	}

	public void clear() {
		items.clear();
	}

	public List<item> getItems() {
		return items;
	}

	public int getCount() {
		int count = 0;
		for (item item : items) {
			count += item.getSoluong();
		}
		return count;
	}

	public int getAmount() {
		int amount = 0;
		for (item item : items) {
			amount += item.getSoluong() * item.getGia();
		}
		return amount;
	}
}
