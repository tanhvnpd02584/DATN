package com.poly.dao;

import java.util.Calendar;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.poly.entity.chitiet;

@Transactional
@Repository
public class chitietDaoImp implements chitietDao {
	@Autowired
	SessionFactory factory;

	@Override
	public chitiet timId(int idloai) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		return session.find(chitiet.class, idloai);
	}

	@Override
	public List<chitiet> danhsach(int id) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		TypedQuery<chitiet> query = session.createQuery("From chitiet where donhang.iddonhang='" + id + "'",
				chitiet.class);
		return query.getResultList();
	}

	@Override
	public chitiet them(chitiet entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void capnhat(chitiet entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public chitiet xoa(int id) {
		List<chitiet> entity = this.danhsach(id);
		Session session = factory.getCurrentSession();
		for (int i = 0; i < entity.size(); i++) {
			session.remove(entity.get(i));
		}
		return null;
	}

	@Override
	public List<Object[]> tkNam() {
		Session se = factory.getCurrentSession();
		TypedQuery<Object[]> ob = se.createQuery("select year(ngaydat) from donhang group by year(ngaydat)", Object[].class);
		List<Object[]> list = ob.getResultList();
		return list;
	}

	@Override
	public int SLsachban() {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		TypedQuery<Long> query = session
				.createQuery("select sum(soluong) from chitiet where donhang.tinhtrangdh=true", Long.class);
		long count = query.getSingleResult();
		int pageCount = (int) Math.ceil(1.0 * count);
		return pageCount;
	}

	@Override
	public List<Object[]> revenu(String date) {
		// TODO Auto-generated method stub
		String hql = "select donhang.iddonhang, donhang.khachhang.hoten, sum(donhang.tong), donhang.ngaydat,donhang.diachi "
				+ "from chitiet " + "where donhang.tinhtrangdh=1 and  ngaydat='" + date
				+ "' group by donhang.iddonhang, donhang.khachhang.hoten,donhang.ngaydat,donhang.diachi";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> ob = session.createQuery(hql, Object[].class);
		List<Object[]> list = ob.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenuKhach() {
		// TODO Auto-generated method stub
		int year = Calendar.getInstance().get(Calendar.YEAR);
		String hql = "select month(donhang.ngaydat),year(donhang.ngaydat),sum(donhang.tong),count(donhang.iddonhang),sum(soluong) \r\n"
				+ "from chitiet where donhang.tinhtrangdh=1 \r\n"
				+ "group by year(donhang.ngaydat),month(donhang.ngaydat) \r\n" + "having year(donhang.ngaydat)='" + year
				+ "'";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> ob = session.createQuery(hql, Object[].class);
		List<Object[]> list = ob.getResultList();
		return list;
	}

	@Override
	public int SLkhach() {
		Session session = factory.getCurrentSession();
		TypedQuery<Long> query = session.createQuery("select count(idkhach) from khachhang", Long.class);
		long count = query.getSingleResult();
		int pageCount = (int) Math.ceil(1.0 * count);
		return pageCount;
	}

	@Override
	public List<Object[]> SLdonhang() {
		String hql = "select count(iddonhang) from donhang group by tinhtrangdh";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> ob = session.createQuery(hql, Object[].class);
		List<Object[]> list = ob.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenuThang(int year, int month) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> ob = session
				.createQuery("select donhang.ngaydat,count(donhang.iddonhang), sum(donhang.tong),sum(soluong) \r\n"
						+ "from chitiet where donhang.tinhtrangdh=1 and year(donhang.ngaydat)='" + year
						+ "' group by ngaydat having month(donhang.ngaydat)='" + month + "'", Object[].class);
		List<Object[]> list = ob.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenuNam(int year) {
		// TODO Auto-generated method stub
		String hql = "select month(donhang.ngaydat),year(donhang.ngaydat),sum(donhang.tong),count(donhang.iddonhang),sum(soluong) \r\n"
				+ "from chitiet where donhang.tinhtrangdh=1 \r\n"
				+ "group by year(donhang.ngaydat),month(donhang.ngaydat) \r\n" + "having year(donhang.ngaydat)='" + year
				+ "'";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> ob = session.createQuery(hql, Object[].class);
		List<Object[]> list = ob.getResultList();
		return list;
	}

}
