package edu.nju.dessert.dao;

import java.util.List;

import edu.nju.dessert.model.Staff;
import edu.nju.dessert.vo.StaffVO;

public interface StaffDao {

	public Staff check(String id, String password);
	
	public String addStaff(Staff staff);
	
	public List<StaffVO> getAllEmployee();
	
	public StaffVO getStaffById(String id);
	
	public List<Staff> getEmployeeByStoreId(int sid);
	
	public List<Staff> getManager();
	
	public List<Staff> getHeadEmploy();
	
	public boolean deleteStaff(String id);
	
	public boolean updateStaff(String id, String name, String tel, String password, int sid, int position);
		
}
