package edu.nju.dessert.service;

import edu.nju.dessert.dao.StaffDao;
import edu.nju.dessert.dao.UserDao;
import edu.nju.dessert.model.Staff;
import edu.nju.dessert.model.User;

public class AuthServiceImpl implements AuthService {

	private UserDao userDao;
	private StaffDao staffDao;
	
	public void setUserDao(UserDao userDao){
		this.userDao = userDao;
	}
	
	public void setStaffDao(StaffDao staffDao) {
		this.staffDao = staffDao;
	}
	
	@Override
	public int login(String tel, String password) {
		return userDao.check(tel, password);
	}

	public Staff loginStaff(String id, String password) {
		return staffDao.check(id, password);
	}
	
	@Override
	public int register(User user) {
		if(userDao.checkUserExist(user.getTel()))
			return -1;
		return userDao.addUser(user);
	}

}
