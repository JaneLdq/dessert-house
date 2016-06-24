package edu.nju.dessert.dao;

import java.util.List;
import java.util.Map;

import edu.nju.dessert.model.Payment;
import edu.nju.dessert.model.Point;
import edu.nju.dessert.model.Store;
import edu.nju.dessert.model.User;

public interface UserDao {
	
	public int addUser(User user);
	
	public boolean checkUserExist(String tel);
	
	public boolean deleteUser(String uid);
	
	public boolean updateUser(User user);
	
	public User getUser(int id);
	
	public List<User> getAllUser();
	
	public int check(String id, String password);

	public void updateUserInfo(int id, String name, int addrId);
	
	public List<Payment> getPayments(int uid, int page, int size);
	
	public int getTotalPaymentPage(int uid, int size);
	
	public int getTotalPointPage(int uid, int size);

	public List<Point> getPoints(int uid, int page, int pageSize);

	public int updatePassword(int uid, String password, String newpwd);

	public boolean updateAvatar(int uid, String url);

    public List<Payment> getAllPayments(int id);

    public Map<String, Long> getAgeStat(String beginYear);

    public boolean cancel(int uid);
    
    public boolean setDefaultAddr(int uid, int aid);

	public boolean setDefaultStore(int uid, int storeId);

	public int getDefaultStore(int uid);

}
