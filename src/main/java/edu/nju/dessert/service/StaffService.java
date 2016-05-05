package edu.nju.dessert.service;

import java.util.List;

import edu.nju.dessert.model.Staff;
import edu.nju.dessert.vo.StaffVO;

public interface StaffService {

	public List<StaffVO> getAllEmployee();
	
	public StaffVO getStaffById(String id);
	
	public List<Staff> getEmployeeByStoreId(int sid);
	
	public List<Staff> getManager();
	
	public List<Staff> getHeadEmploy();
	
	public boolean deleteStaff(String id);
	
	public boolean updateStaff(String id, String name, String tel, String password, int sid, int position);
	
	public String addStaff(String name, String tel, String password, int sid, int position);

}
