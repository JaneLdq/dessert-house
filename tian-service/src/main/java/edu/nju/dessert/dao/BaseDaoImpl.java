package edu.nju.dessert.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class BaseDaoImpl implements BaseDao {

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public Session getNewSession() {
		return sessionFactory.openSession();
	}

	@Override
	public void flush() {
		getSession().flush();
	}

	@Override
	public void clear() {
		getSession().clear();
	}
	
	@SuppressWarnings("rawtypes")
	public Object load(Class c, String id) {
		Session session = getSession();
		return session.get(c, id);
	}

	@SuppressWarnings("rawtypes")
	public List getAllList(Class c) {
		String hql = "from " + c.getName();
		Session session = getSession();
		return session.createQuery(hql).list();

	}

	@SuppressWarnings("rawtypes")
	public Long getTotalCount(Class c) {
		Session session = getSession();
		String hql = "select count(*) from " + c.getName();
		Long count = (Long) session.createQuery(hql).uniqueResult();
		session.close();
		return count != null ? count.longValue() : 0;
	}

	public boolean save(Object bean) {
		try {
			Session session = getSession();
			session.save(bean);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean update(Object bean) {
		try {
			Session session = getSession();
			session.update(bean);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean delete(Object bean) {
		try {
			Session session = getSession();
			session.delete(bean);
		}catch (Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@SuppressWarnings({ "rawtypes" })
	public void delete(Class c, String id) {
		Session session = getSession();
		Object obj = session.get(c, id);
		session.delete(obj);
	}

	@SuppressWarnings({ "rawtypes" })
	public void delete(Class c, String[] ids) {
		for (String id : ids) {
			Object obj = getSession().get(c, id);
			if (obj != null) {
				getSession().delete(obj);
			}
		}
	}

}
