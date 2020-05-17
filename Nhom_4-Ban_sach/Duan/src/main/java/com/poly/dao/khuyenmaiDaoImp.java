package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.poly.entity.khuyenmai;

@Transactional
@Repository
public class khuyenmaiDaoImp implements khuyenmaiDao {
	@Autowired
	SessionFactory factory;

	@Override
	public khuyenmai timId(int idloai) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		return session.find(khuyenmai.class, idloai);
	}

	@Override
	public List<khuyenmai> timIdsach(int id) {
		Session session = factory.getCurrentSession();
		TypedQuery<khuyenmai> query = session.createQuery("from khuyenmai where idsach='" + id + "'", khuyenmai.class);
		return query.getResultList();
	}

	@Override
	public List<khuyenmai> danhsach() {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		TypedQuery<khuyenmai> query = session.createQuery("from khuyenmai where trangthai= true", khuyenmai.class);
		return query.getResultList();
	}
	@Override
	public List<khuyenmai> danhsachkm() {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		TypedQuery<khuyenmai> query = session.createQuery("from khuyenmai", khuyenmai.class);
		return query.getResultList();
	}

	@Override
	public khuyenmai them(khuyenmai entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void capnhat(khuyenmai entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public khuyenmai xoa(int id) {
		// TODO Auto-generated method stub
		khuyenmai entity = this.timId(id);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}

}
