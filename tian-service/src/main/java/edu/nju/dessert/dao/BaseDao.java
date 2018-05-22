package edu.nju.dessert.dao;

import java.util.List;

import org.hibernate.Session;

public interface BaseDao {
	
	public Session getSession();

	public Session getNewSession();
	
	public void flush();

	public void clear() ;

	@SuppressWarnings("rawtypes")
	public Object load(Class c, String id) ;

	@SuppressWarnings("rawtypes")
	public List getAllList(Class c) ;
	
	@SuppressWarnings("rawtypes")
	public Long getTotalCount(Class c) ;

	public boolean save(Object bean) ;

	public boolean update(Object bean) ;

	public boolean delete(Object bean) ;
	
	@SuppressWarnings("rawtypes")
	public void delete(Class c, String id) ;

	@SuppressWarnings("rawtypes")
	public void delete(Class c, String[] ids) ;
	
}
