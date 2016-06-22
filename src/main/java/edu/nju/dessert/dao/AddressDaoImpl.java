package edu.nju.dessert.dao;

import java.util.List;

import org.hibernate.Query;

import edu.nju.dessert.model.Address;

public class AddressDaoImpl implements AddressDao {
	
	private BaseDao baseDao;
	
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public int addAddress(int uid, String address, String tel, String receiver) {
		Address addr = new Address(uid, address, tel, receiver);
		boolean result = baseDao.save(addr);
		if(result){
			return addr.getId();
		}else{
			return -1;
		}
	}

	@Override
	public boolean deleteAddress(int id) {
		String hql = "delete from Address where id='" + id + "'";
		Query query = baseDao.getSession().createQuery(hql);
		int result = query.executeUpdate();
		if(result > 0)
			return true;
		return false;
	}

	@Override
	public boolean updateAddress(int id, String address, String tel, String receiver) {
		String hql = "update Address set address='" + address  + "', tel='" + tel + "', receiver='"
				+ receiver + "' where id='" + id + "'";
		Query query = baseDao.getSession().createQuery(hql);
		int result = query.executeUpdate();
		if(result == 1)
			return true;
		return false;
	}

	@Override
	public List<Address> getUserAddresses(int uid) {
		String hql = "from Address where uid=" + uid;
		Query query = baseDao.getSession().createQuery(hql);
		List<Address> result = query.list();
		return result;
	}

	@Override
	public Address getAddress(int id) {
		String hql = "from Address where id=" + id;
		Query query = baseDao.getSession().createQuery(hql);
		List<Address> result = query.list();
		if(result.size() > 0){
			return result.get(0);
		}
		return null;
	}

}
