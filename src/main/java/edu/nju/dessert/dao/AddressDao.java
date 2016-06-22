package edu.nju.dessert.dao;

import java.util.List;

import edu.nju.dessert.model.Address;

public interface AddressDao {

	public int addAddress(int uid, String address, String tel, String receiver);
	
	public boolean deleteAddress(int id);
	
	public boolean updateAddress(int id, String address, String tel, String receiver);
	
	public List<Address> getUserAddresses(int uid);
	
	public Address getAddress(int id);
	
}
