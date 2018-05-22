package edu.nju.dessert.dao;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.nju.dessert.model.Payment;
import edu.nju.dessert.model.Point;
import edu.nju.dessert.model.User;
import edu.nju.dessert.util.DateTranslator;

@Repository
public class UserDaoImpl implements UserDao {
	
	private BaseDao baseDao;
	
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	@Override
	@Transactional
	public int addUser(User user) {
		boolean result = baseDao.save(user);
		if(result == false){
			return -1;
		}
		return 1;
	}

	@Override
	public boolean deleteUser(String uid) {
		// deleteUser
		return false;
	}

	@Override
	public boolean updateUser(User user) {
		String hql = "update User set name='" + user.getName() 
				+ "', nickname='" + user.getNickname()
				+ "', sex=" + user.getSex() + ", birth='" + user.getBirth() + "' "
				+ " where id=" + user.getId();
		Query query = baseDao.getSession().createQuery(hql);
		int result = query.executeUpdate();
		if(result == 1)
			return true;
		return false;
	}

	@Override
	public User getUser(int id) {
		String hql = "from User where id=" + id;
		Query query = baseDao.getSession().createQuery(hql);
		List<User> list = query.list();
		if(list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<User> getAllUser() {
		// TODO getAllUser
		return null;
	}

	@Override
	public int check(String tel, String password) {
		if(tel == null){
			tel = "";
		}
		if(password == null){
			password = "";
		}
		String hql = "select id from User where tel='" + tel +"' and password='" + password + "'";
		Session session = baseDao.getSession();
		Query query = session.createQuery(hql);
		@SuppressWarnings("rawtypes")
		List result = query.list();
		if(result.isEmpty())
			return -1;
		int uid = (int)result.get(0);
		return uid;
	}

	@Override
	public void updateUserInfo(int id, String name, int addrId) {
	
		String hql = "update User set name='" + name + "', default_addr='" + addrId + "' "
				+ " where id=" + id;
		Query query = baseDao.getSession().createQuery(hql);
		query.executeUpdate();
		
	}

	@Override
	public List<Payment> getPayments(int uid, int page, int size) {
		String hql = "from Payment where uid=" + uid + " order by created_at desc";
		Query query = baseDao.getSession().createQuery(hql).setFirstResult(page*size).setMaxResults(size);
		List<Payment> payments = query.list();
		return payments;
	}

	@Override
	public List<Point> getPoints(int uid, int page, int size) {
		String hql = "from Point where uid=" + uid + " order by created_at desc";
		Query query = baseDao.getSession().createQuery(hql).setFirstResult(page*size).setMaxResults(size);
		List<Point> points = query.list();
		return points;
	}

	@Override
	public int getTotalPaymentPage(int uid, int size) {
		String hql = "select count(*) from Payment where uid=" + uid;
		Query query = baseDao.getSession().createQuery(hql);
		Long count = (Long) query.uniqueResult();
		return calPages(count, size);
	}

	@Override
	public int getTotalPointPage(int uid, int size) {
		String hql = "select count(*) from Point where uid=" + uid;
		Query query = baseDao.getSession().createQuery(hql);
		Long count = (Long) query.uniqueResult();
		return calPages(count, size);
	}
	

	private int calPages(Long count, int size){
		int pages = 0;
		if(size != 0)
			pages = (int) (count / size);
		if(pages % size != 0)
			pages = pages + 1;
		return pages;
	}

	@Override
	public int updatePassword(int uid, String password, String newpwd) {
		String hql = "update User set password='" + newpwd + "' where id=" + uid
				+ " and password='" + password + "'";
		Query query = baseDao.getSession().createQuery(hql);
		int result = query.executeUpdate();
		if(result == 1)
			return 1;
		return 0;
	}

	@Override
	public boolean updateAvatar(int uid, String url) {
		String hql = "update User set avatar='" + url + "' where id=" + uid;
		Query query = baseDao.getSession().createQuery(hql);
		int result = query.executeUpdate();
		if(result == 1)
			return true;
		return false;
	}

    @Override
    public List<Payment> getAllPayments(int id) {
        String hql = "from Payment where uid=" + id;
        Query query = baseDao.getSession().createQuery(hql);
        List<Payment> list = query.list();
        return list;
    }

    @Override
    public Map<String, Long> getAgeStat(String beginYearStr) {
        String hql = "select max(birth) from User";
        Query query = baseDao.getSession().createQuery(hql);
        Date max = (Date) query.uniqueResult();
        Calendar c = Calendar.getInstance(); 
        c.setTime(max); 
        int maxYear = c.get(Calendar.YEAR);
        
        hql = "select min(birth) from User";
        query = baseDao.getSession().createQuery(hql);
        Date min = (Date) query.uniqueResult();
        c = Calendar.getInstance(); 
        c.setTime(min); 
        int minYear = c.get(Calendar.YEAR);
        
        hql = "select count(id) from User where birth>=? and birth<?";
        query = baseDao.getSession().createQuery(hql);
        
        int endYear = Integer.parseInt(beginYearStr);
        Date begin = DateTranslator.strToDate(minYear + "-01-01");
        Date end = DateTranslator.strToDate(beginYearStr + "-01-01");
        
        Map<String, Long> map = new HashMap<String ,Long>();
        while(endYear <= maxYear){
            query.setString(0, DateTranslator.dateToStr(begin));
            query.setString(1, DateTranslator.dateToStr(end));
            Long sum = (Long) query.uniqueResult();
            if(sum == null){
                sum = (long) 0;
            }
            map.put(Integer.toString(endYear),sum);  
            begin = DateTranslator.strToDate(endYear + "-01-01");
            endYear += 5;
            end = DateTranslator.strToDate(endYear + "-01-01");
        }
        return map;
    }

    @Override
    public boolean cancel(int uid) {
        String hql = "update Member set state=3 where uid=" + uid;
        Query query = baseDao.getSession().createQuery(hql);
        int result = query.executeUpdate();
        if(result>0)
            return true;
        return false;
    }

	@Override
	public boolean checkUserExist(String tel) {
		String hql = "select id from User where tel='" + tel +"'";
		Session session = baseDao.getSession();
		Query query = session.createQuery(hql);
		@SuppressWarnings("rawtypes")
		List result = query.list();
		if(result.isEmpty())
			return false;
		return true;
	}

	@Override
	public boolean setDefaultAddr(int uid, int aid) {
		String hql = "update User set default_addr="+ aid + " where id="+uid;
		Query query = baseDao.getSession().createQuery(hql);
		int result = query.executeUpdate();
		if (result > 0) return true;
		return false;
	}

	@Override
	public boolean setDefaultStore(int uid, int storeId) {
		String hql = "update User set default_store="+ storeId + " where id="+uid;
		Query query = baseDao.getSession().createQuery(hql);
		int result = query.executeUpdate();
		if (result > 0) return true;
		return false;
	}

	@Override
	public int getDefaultStore(int uid) {
		String hql = "select default_store from User where id=" + uid;
		Query query = baseDao.getSession().createQuery(hql);
		List<Integer> stores = query.list();
		if(stores.size() > 0 && stores.get(0) != null)
			return stores.get(0);
		return -1;
	}

}
