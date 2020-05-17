package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.poly.entity.nhanvien;

@Transactional
@Repository
public class nhanvienDaoImp implements nhanvienDao {
	@Autowired
	SessionFactory factory;

	@Override
	public nhanvien timId(int idloai) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		return session.find(nhanvien.class, idloai);
	}

	@Override
	public List<nhanvien> danhsachnv() {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		TypedQuery<nhanvien> query = session.createQuery("From nhanvien where quyen=0", nhanvien.class);
		return query.getResultList();
	}

	@Override
	public nhanvien them(nhanvien entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void capnhat(nhanvien entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public nhanvien xoa(int id) {
		nhanvien entity = this.timId(id);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}

	@Override
	public List<nhanvien> User(String email) {
		Session session = factory.getCurrentSession();
		TypedQuery<nhanvien> query = session.createQuery("From nhanvien where quyen=0 and email='" + email + "'",
				nhanvien.class);
		return query.getResultList();
	}

	@Override
	public List<nhanvien> danhsachadmin() {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		TypedQuery<nhanvien> query = session.createQuery("From nhanvien where quyen=1", nhanvien.class);
		return query.getResultList();
	}

	@Override
	public List<nhanvien> Userad(String email) {
		Session session = factory.getCurrentSession();
		TypedQuery<nhanvien> query = session.createQuery("From nhanvien where quyen=1 and email='" + email + "'",
				nhanvien.class);
		return query.getResultList();
	}
}
