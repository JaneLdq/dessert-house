package edu.nju.dessert.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import edu.nju.dessert.model.Staff;
import edu.nju.dessert.vo.StaffVO;

public class StaffDaoImpl implements StaffDao {
	
	private BaseDao baseDao;
	
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public Staff check(String id, String password) {
		if(id == null){
			id = "";
		}
		if(password == null){
			password = "";
		}
		String hql = "from Staff where sid='" + id +"' and password='" + password + "'";
		Session session = baseDao.getSession();
		Query query = session.createQuery(hql);
		@SuppressWarnings("rawtypes")
		List result = query.list();
		if(result.isEmpty())
			return null;
		return (Staff) result.get(0);
	}

	@Override
	public String addStaff(Staff staff) {
		String id = getStaffId(staff.getPosition());
		staff.setSid(id);
		boolean result = baseDao.save(staff);
		if(result){
			return id;
		}else{
			return null;
		}
	}

	@Override
	public List<StaffVO> getAllEmployee() {
		String sql = "select s.sid, s.name, s.tel, s.password, s.store_id, s.position, st.name as storename,s.id from Staff s left join Store st on s.store_id = st.id where "
				+ "s.sid like 'E%' or s.sid like 'H%'";
		Query query = baseDao.getSession().createSQLQuery(sql);
		List<Object[]> objects = query.list();
		List<StaffVO> list = new ArrayList<StaffVO>();
		for(Object[] obj: objects){
			StaffVO vo = new StaffVO();
			vo.setSid((String)obj[0]);
			vo.setName((String)obj[1]);
			vo.setTel((String)obj[2]);
			vo.setPassword((String)obj[3]);
			vo.setStore_id((Integer)obj[4]);
			vo.setPosition((Integer)obj[5]);
			vo.setStoreName((String)obj[6]);
			vo.setId((Integer)obj[7]);
			list.add(vo);
		}
		return list;
	}

	@Override
	public StaffVO getStaffById(String id) {
		String hql = "select new edu.nju.dessert.vo.StaffVO(s.id, s.sid, s.name, s.tel, s.password, s.store_id, "
		        + "s.position, st.name) from Staff s, Store st where sid='" + id + "' and s.store_id = st.id";
		Query query = baseDao.getSession().createQuery(hql);
		StaffVO result = (StaffVO) query.uniqueResult();
		return result;
	}

	@Override
	public List<Staff> getEmployeeByStoreId(int sid) {
		String hql = "from Staff where store_id=" + sid;
		Query query = baseDao.getSession().createQuery(hql);
		List<Staff> list = query.list();
		return list;
	}

	@Override
	public List<Staff> getManager() {
		String hql = "from Staff where sid like 'M%'";
		Query query = baseDao.getSession().createQuery(hql);
		List<Staff> list = query.list();
		return list;
	}

	@Override
	public List<Staff> getHeadEmploy() {
		String hql = "from Staff where sid like 'H%'";
		Query query = baseDao.getSession().createQuery(hql);
		List<Staff> list = query.list();
		return list;
	}

	@Override
	public boolean deleteStaff(String id) {
		String hql = "delete from Staff where id='" + id + "'";
		Query query = baseDao.getSession().createQuery(hql);
		int result = query.executeUpdate();
		if(result > 0)
			return true;
		return false;
	}

	@Override
	public boolean updateStaff(String id, String name, String tel, String password, int sid, int position) {
	    System.out.println(id + " " + sid);
		String hql = "update Staff set name='" + name  + "', tel='" + tel + "', password='" 
				+ password + "', store_id=" + sid + ", position=" + position + " where id='" + id + "'";
		Query query = baseDao.getSession().createQuery(hql);
		int result = query.executeUpdate();
		if(result == 1)
			return true;
		return false;
	}
	
	public String getStaffId(int position){
		String id = null;
		switch (position) {
		case 1:
			id = getNewId("M");
			break;
		case 2:
			id = getNewId("H");
			break;
		case 3:
			id = getNewId("E");
			break;
		default:
			break;
		}
		return id;
	}
	
	private String getNewId(String prefix){
		String hql = "select max(sid) from Staff where sid like '" + prefix + "%'";
		Query query = baseDao.getSession().createQuery(hql);
		String result = (String) query.uniqueResult();
		int num = 0;
		if(result!=null){
			num = Integer.parseInt(result.substring(1));
		}
		String str = Integer.toString(num+1);
		int len = str.length();
		for(int i=0; i<(7-len-prefix.length()); ++i){
			str = "0" + str;
		}
		str = prefix + str;
		return str;
	}

}
