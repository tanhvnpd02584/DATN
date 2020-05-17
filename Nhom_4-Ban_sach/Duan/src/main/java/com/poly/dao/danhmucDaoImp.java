package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.poly.entity.danhmuc;

@Transactional
@Repository
public class danhmucDaoImp implements danhmucDao {
	@Autowired
	SessionFactory factory;

	@Override
	public danhmuc timId(int idloai) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		return session.find(danhmuc.class, idloai);
	}

	@Override
	public List<danhmuc> danhsach() {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		TypedQuery<danhmuc> query = session.createQuery("from danhmuc", danhmuc.class);
		return query.getResultList();
	}

	@Override
	public danhmuc them(danhmuc entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void capnhat(danhmuc entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public List<danhmuc> danhsac(int id) {
		Session session = factory.getCurrentSession();
		TypedQuery<danhmuc> query = session.createQuery("from danhmuc where iddanhmuc='" + id + "'", danhmuc.class);
		return query.getResultList();
	}

	@Override
	public List<Object[]> thongke() {
		String hql = "select loaisach.danhmuc.tendanhmuc, Sum(soluong) from sach group by loaisach.danhmuc.tendanhmuc";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> ob = session.createQuery(hql, Object[].class);
		List<Object[]> list = ob.getResultList();
		return list;
	}
}
