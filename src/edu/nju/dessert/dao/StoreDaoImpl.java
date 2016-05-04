package edu.nju.dessert.dao;

import java.util.List;

import org.hibernate.Query;

import edu.nju.dessert.model.Store;

public class StoreDaoImpl implements StoreDao {

	private BaseDao baseDao;
	
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Store> getAllStore() {
		return baseDao.getAllList(Store.class);
	}

	@Override
	public Store getStore(int id) {
		String hql = "from Store where id=" + id;
		Query query = baseDao.getSession().createQuery(hql);
		List<Store> result = query.list();
		if(result.size()>0)
			return result.get(0);
		return null;
	}

	@Override
	public int updateStore(int sid, String name, String tel, String address, String desc) {
		String hql = "update Store set name='" + name + "', tel='" + tel 
				+ "', address='" + address + "', description='" + desc + "' where id=" + sid;
		Query query = baseDao.getSession().createQuery(hql);
		int result = query.executeUpdate();
		if(result == 1)
			return 1;
		return 0;
	}

	@Override
	public int deleteStore(int sid) {
		String hql = "delete from Store where id=" + sid;
		Query query = baseDao.getSession().createQuery(hql);
		int result = query.executeUpdate();
		if(result == 1)
			return 1;
		return 0;
	}

	@Override
	public int addStore(String name, String tel, String address, String desc) {
		Store store = new Store();
		store.setName(name);
		store.setTel(tel);
		store.setAddress(address);
		store.setDescription(desc);
		boolean result = baseDao.save(store);
		if(result){
			String hql = "select id from Store where name='" + name + "' and tel='" + tel + "'"
					+ " and address='" + address + "'";
			Query query = baseDao.getSession().createQuery(hql);
			query.getQueryString();
			List<Integer> list = query.list();
			if(list.size()>0)
				return list.get(0);
		}
		return 0;
	}


}
