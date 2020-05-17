package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.poly.entity.loaisach;

@Transactional
@Repository
public class loaisachDaoImp implements loaisachDao {
	@Autowired
	SessionFactory factory;

	@Override
	public loaisach timId(int idloai) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		return session.find(loaisach.class, idloai);
	}

	@Override
	public List<loaisach> danhsach() {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		TypedQuery<loaisach> query = session.createQuery("from loaisach", loaisach.class);
		return query.getResultList();
	}

	@Override
	public loaisach them(loaisach entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void capnhat(loaisach entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public List<loaisach> danhsach(int iddanhmuc) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		TypedQuery<loaisach> query = session.createQuery("from loaisach where danhmuc.iddanhmuc='" + iddanhmuc + "'",
				loaisach.class);
		return query.getResultList();
	}

	@Override
	public List<loaisach> danhsacha(int tenloai) {
		Session session = factory.getCurrentSession();
		TypedQuery<loaisach> query = session.createQuery("from loaisach where idloai='" + tenloai + "'",
				loaisach.class);
		return query.getResultList();
	}

}
