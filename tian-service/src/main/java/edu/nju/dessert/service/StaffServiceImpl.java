package edu.nju.dessert.service;

import java.util.List;

import edu.nju.dessert.dao.StaffDao;
import edu.nju.dessert.model.Staff;
import edu.nju.dessert.vo.StaffVO;
import org.springframework.stereotype.Service;

@Service
public class StaffServiceImpl implements StaffService {
	
	private StaffDao staffDao;
	
	public void setStaffDao(StaffDao staffDao) {
		this.staffDao = staffDao;
	}

	@Override
	public List<StaffVO> getAllEmployee() {
		return staffDao.getAllEmployee();
	}

	@Override
	public StaffVO getStaffById(String id) {
		return staffDao.getStaffById(id);
	}

	@Override
	public List<Staff> getEmployeeByStoreId(int sid) {
		return staffDao.getEmployeeByStoreId(sid);
	}

	@Override
	public List<Staff> getManager() {
		return staffDao.getManager();
	}

	@Override
	public List<Staff> getHeadEmploy() {
		return staffDao.getHeadEmploy();
	}

	@Override
	public boolean deleteStaff(String id) {
		return staffDao.deleteStaff(id);
	}

	@Override
	public boolean updateStaff(String id, String name, String tel, String password, int sid, int position) {
		return staffDao.updateStaff(id, name, tel, password, sid, position);
	}

	@Override
	public String addStaff(String name, String tel, String password, int sid, int position) {
		Staff staff = new Staff();
		staff.setName(name);
		staff.setTel(tel);
		staff.setPassword(password);
		staff.setStore_id(sid);
		staff.setPosition(position);
		String id = staffDao.addStaff(staff);
		return id;
	}

}
