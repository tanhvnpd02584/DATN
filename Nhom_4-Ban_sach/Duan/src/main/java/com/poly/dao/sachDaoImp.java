package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.poly.entity.sach;

@Transactional
@Repository
public class sachDaoImp implements sachDao {
	@Autowired
	SessionFactory factory;

	int page = 8;

	@Override
	public sach timId(int idsach) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		return session.find(sach.class, idsach);
	}

	@Override
	public List<sach> danhsach() {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		TypedQuery<sach> query = session.createQuery("from sach", sach.class);
		return query.getResultList();
	}

	@Override
	public sach them(sach entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void capnhat(sach entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public List<sach> danhsach(int id, int pageNo) {
		Session session = factory.getCurrentSession();
		TypedQuery<sach> query = session.createQuery("from sach where idloai='" + id + "'", sach.class);
		query.setFirstResult(page * pageNo);
		query.setMaxResults(page);
		return query.getResultList();
	}

	@Override
	public int getPageCount(int id) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		TypedQuery<Long> query = session.createQuery("select count(sach) from sach where idloai='" + id + "'",
				Long.class);
		long count = query.getSingleResult();
		int pageCount = (int) Math.ceil(1.0 * count / page);
		System.out.println(pageCount);
		return pageCount;
	}

	@Override
	public List<sach> timsach(String ten) {
		Session session = factory.getCurrentSession();
		TypedQuery<sach> query = session.createQuery("from sach where tensach like'%" + ten + "%'", sach.class);
		return query.getResultList();
	}

	@Override
	public List<Object[]> inventory() {
		String hql = "select loaisach.idloai, loaisach.tenloai, sum(soluong), sum(gia*soluong), min(gia), max(gia), avg(gia)  from sach group by loaisach.idloai, loaisach.tenloai";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> ob = session.createQuery(hql, Object[].class);
		List<Object[]> list = ob.getResultList();
		return list;
	}

	@Override
	public int SLsach() {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		TypedQuery<Long> query = session.createQuery("select count(idsach) from sach", Long.class);
		long count = query.getSingleResult();
		int pageCount = (int) Math.ceil(1.0 * count);
		return pageCount;
	}

	@Override
	public sach xoa(int id) {
		sach s = timId(id);
		Session session = factory.getCurrentSession();
		session.remove(s);
		return s;
	}

}
