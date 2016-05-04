package edu.nju.dessert.service;

import java.util.List;

import edu.nju.dessert.model.Store;

public interface StoreService {

	public List<Store> getAllStore();

	public Store getStore(int id);

	public int update(int sid, String name, String tel, String address, String desc);

	public int deleteStore(int sid);

	public int addStore(String name, String tel, String address, String desc);
	
}
