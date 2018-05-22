package edu.nju.dessert.service;

import edu.nju.dessert.model.Address;

import java.util.List;

public interface AddressService {

    public Address getDefaultAddress(int uid);

    public boolean setDefaultAddress(int uid, int aid);

    public boolean setDefaultAddress(int uid, String address, String tel);

    public List<Address> getAddresses(int uid);

    public List<Address> getAddressesExceptDefault(int uid);

    public int addAddress(int uid, String address, String tel, String receiver);

    public boolean updateAddress(int aid, String address, String tel, String receiver);

    public boolean deleteAddress(int uid, int aid);

    public Address getAddress(int aid);

}
