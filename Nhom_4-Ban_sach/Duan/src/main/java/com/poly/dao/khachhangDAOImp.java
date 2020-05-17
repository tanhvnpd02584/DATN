package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.poly.entity.khachhang;

@Transactional
@Repository
public class khachhangDAOImp implements khachhangDao {
	@Autowired
	SessionFactory factory;

	@Override
	public khachhang timId(String email) {
		Session session = factory.getCurrentSession();
		return session.find(khachhang.class, email);
	}

	@Override
	public List<khachhang> danhsach() {
		Session session = factory.getCurrentSession();
		TypedQuery<khachhang> query = session.createQuery("from khachhang", khachhang.class);
		return query.getResultList();
	}

	@Override
	public khachhang them(khachhang entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void capnhat(khachhang entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public List<khachhang> User(String email) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		TypedQuery<khachhang> query = session.createQuery("from khachhang where email='" + email + "'",
				khachhang.class);
		return query.getResultList();
	}

}
