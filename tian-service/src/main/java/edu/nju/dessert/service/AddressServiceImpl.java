package edu.nju.dessert.service;

import edu.nju.dessert.dao.AddressDao;
import edu.nju.dessert.dao.UserDao;
import edu.nju.dessert.model.Address;
import edu.nju.dessert.model.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AddressServiceImpl implements AddressService {

    private UserDao userDao;

    private AddressDao addressDao;

    @Override
    public Address getDefaultAddress(int uid) {
        User user = userDao.getUser(uid);
        return addressDao.getAddress(user.getDefault_addr());
    }

    @Override
    public boolean setDefaultAddress(int uid, int aid) {
        return userDao.setDefaultAddr(uid, aid);
    }

    @Override
    public boolean setDefaultAddress(int uid, String address, String tel) {
        User user = userDao.getUser(uid);
        int aid = addressDao.addAddress(uid, address, tel, user.getName());
        return userDao.setDefaultAddr(uid, aid);
    }

    @Override
    public List<Address> getAddresses(int uid) {
        User user = userDao.getUser(uid);
        return addressDao.getUserAddresses(uid);
    }

    @Override
    public List<Address> getAddressesExceptDefault(int uid) {
        User user = userDao.getUser(uid);
        List<Address> list = addressDao.getUserAddresses(uid);
        Address defaultAddr = null;
        for (Address addr: list) {
            if (addr.getId() == user.getDefault_addr()) {
                defaultAddr = addr;
            }
        }
        if (defaultAddr != null) {
            list.remove(defaultAddr);
        }
        return list;
    }

    @Override
    public int addAddress(int uid, String address, String tel, String receiver) {
        return addressDao.addAddress(uid, address, tel, receiver);
    }

    @Override
    public boolean updateAddress(int aid, String address, String tel, String receiver) {
        return addressDao.updateAddress(aid, address, tel, receiver);
    }

    @Override
    public boolean deleteAddress(int uid, int aid) {
        Address address = getDefaultAddress(uid);
        // 不允许删除默认收获地址
        if (aid == address.getId()) {
            return false;
        }
        return addressDao.deleteAddress(aid);
    }

    @Override
    public Address getAddress(int aid) {
        return addressDao.getAddress(aid);
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public void setAddressDao(AddressDao addressDao) {
        this.addressDao = addressDao;
    }

}
