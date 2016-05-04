package edu.nju.dessert.service;

import java.util.List;

import edu.nju.dessert.dao.StoreDao;
import edu.nju.dessert.model.Store;

public class StoreServiceImpl implements StoreService {

	private StoreDao storeDao;
	
	public void setStoreDao(StoreDao storeDao) {
		this.storeDao = storeDao;
	}
	
	@Override
	public List<Store> getAllStore() {
		return storeDao.getAllStore();
	}

	@Override
	public Store getStore(int id) {
		return storeDao.getStore(id);
	}

	@Override
	public int update(int sid, String name, String tel, String address, String desc) {
		return storeDao.updateStore(sid, name, tel, address, desc);
	}

	@Override
	public int deleteStore(int sid) {
		return storeDao.deleteStore(sid);
	}

	@Override
	public int addStore(String name, String tel, String address, String desc) {
		return storeDao.addStore(name, tel, address,desc);
	}


}
