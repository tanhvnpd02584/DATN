package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.poly.entity.donhang;

@Transactional
@Repository
public class donhangDaoImp implements donhangDao {
	@Autowired
	SessionFactory factory;

	@Override
	public donhang timId(int idloai) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		return session.find(donhang.class, idloai);
	}

	@Override
	public List<donhang> danhsach(int id) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		TypedQuery<donhang> query = session.createQuery("from donhang where khachhang.idkhach='" + id + "'",
				donhang.class);
		return query.getResultList();
	}

	@Override
	public donhang them(donhang entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		System.out.println(entity.getKhachhang().getIdkhach());
		session.save(entity);
		return entity;
	}

	@Override
	public void capnhat(donhang entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public donhang huy(int id) {
		donhang entity = this.timId(id);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}

	@Override
	public List<donhang> danhsachdg() {
		Session session = factory.getCurrentSession();
		TypedQuery<donhang> query = session.createQuery("from donhang where tinhtrangdh = 0", donhang.class);
		return query.getResultList();
	}

	@Override
	public List<donhang> danhsachdd() {
		Session session = factory.getCurrentSession();
		TypedQuery<donhang> query = session.createQuery("from donhang where tinhtrangdh = 1", donhang.class);
		return query.getResultList();
	}

	@Override
	public int tongtien() {
		Session ss = factory.getCurrentSession();
		TypedQuery<Long> query = ss.createQuery("select sum(tong) from donhang where tinhtrangdh =1", Long.class);
		long count = query.getSingleResult();
		int pageCount = (int) Math.ceil(count);
		return pageCount;
	}

}
