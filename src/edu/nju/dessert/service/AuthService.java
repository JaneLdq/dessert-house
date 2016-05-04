package edu.nju.dessert.service;

import edu.nju.dessert.model.Staff;
import edu.nju.dessert.model.User;

public interface AuthService {

	public int login(String tel, String password);
	
	public Staff loginStaff(String id, String password);
	
	public int register(User user);
	
}
