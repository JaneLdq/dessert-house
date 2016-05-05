package edu.nju.dessert.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.springframework.transaction.annotation.Transactional;

import edu.nju.dessert.model.Member;
import edu.nju.dessert.model.Payment;
import edu.nju.dessert.model.Point;
import edu.nju.dessert.util.DiscountCalculator;
import edu.nju.dessert.vo.MemberVO;

public class MemberDaoImpl implements MemberDao{

	private BaseDao baseDao;
	
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	@Override
	public Member getMemberByMid(String memberId) {
	    System.out.println(memberId);
		String hql = "from Member where mid='" + memberId + "'";
		Query query = baseDao.getSession().createQuery(hql);
		List<Member> members = query.list();
		if(members.size() > 0){
			return members.get(0);
		}
		return null;
	}

	@Override
	public Member getMember(int uid) {
		String hql = "from Member where uid=" + uid;
		Query query = baseDao.getSession().createQuery(hql);
		List<Member> members = query.list();
		if(members.size() > 0){
			return members.get(0);
		}
		return null;
	}
	
	@Override
	public int getMemberLevel(int uid){
		String hql = "select level from Member where uid=" + uid;
		Query query = baseDao.getSession().createQuery(hql);
		List<Integer> level = query.list();
		if(level.size() > 0)
			return level.get(0);
		return -1;
	}

	@Override
	public int getMaxId() {
		String hql = "select max(id) from Member";
		Query query = baseDao.getSession().createQuery(hql);
		Integer result = (Integer) query.uniqueResult();
		if(result == null)
			return 0;
		return result;
	}

	@Override
	@Transactional
	public boolean addMember(int uid, String bankcard, String paypassword) {
		Member member = new Member();
		int next = this.getMaxId()+1;
		String mid = this.getMemberId(next);
		member.setMid(mid);
		member.setUid(uid);
		member.setBank_card(bankcard);
		member.setPayword(paypassword);
		return baseDao.save(member);
	}
	
	private String getMemberId(int number){
		String str = Integer.toString(number);
		int len = str.length();
		for(int i=0; i<(6-len); ++i){
			str = "0" + str;
		}
		str = "V" + str;
		return str;
	}

	@Override
	@Transactional
	public boolean charge(int uid, String password, int value) {
		String hql = "update Member set balance = balance + " + value + " where uid =" + uid
				 + " and payword='" + password + "'";
		Query query = baseDao.getSession().createQuery(hql);
		int result = query.executeUpdate();
		if(result > 0){
			baseDao.save(new Payment(uid, value, new Date()));
			return true;
		}
		return false;
	}

	@Override
	public int updateLevel(int uid) {
		String hql = "select sum(value) from Payment where uid=" + uid;
		Query query = baseDao.getSession().createQuery(hql);
		Double total = (Double) query.uniqueResult();
		hql = "select level from Member where uid=" + uid;
		query = baseDao.getSession().createQuery(hql);
		int level = (int) query.uniqueResult();
		if(total > 1600){
			level = 3;
		}else if(total > 900){
			level = 2;
		}else if(total > 600){
			level = 1;
		}
		hql = "update Member set level=" + level +" where uid="+uid;
		baseDao.getSession().createQuery(hql).executeUpdate();
		return level;
	}

	@Override
	public boolean activate(int uid, String password, int value) {
		if(value >= 200){
			String hql = "update Member set balance = balance + " + value + ", state=1,"
					+ "active_time=CURRENT_TIMESTAMP where uid =" + uid
					 + " and payword='" + password + "'";
			Query query = baseDao.getSession().createQuery(hql);
			int result = query.executeUpdate();
			if(result > 0){
				baseDao.save(new Payment(uid, value, new Date()));
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean exchangePoint(int uid, int point) {
		String hql = "update Member set point = point - " + point + ""
				+ ", balance = balance + " + point/10 + " where uid=" + uid;
		Query query = baseDao.getSession().createQuery(hql);
		int result = query.executeUpdate();
		if(result > 0){
			baseDao.save(new Point(uid, point, new Date(), 1));
			return true;
		}
		return false;
	}

	@Override
	public void updateAccount(int uid, double total, double discount) {
		int p = DiscountCalculator.calPoint(total);
		String hql = "update Member set point = point + " + p
				+ ", balance = balance - " + (total-discount) + " where uid=" + uid;
		Query query = baseDao.getSession().createQuery(hql);
		query.executeUpdate();
		Point point = new Point(uid, p, new Date(), 0);
		baseDao.save(point);
	}

	@Override
	public boolean checkBalance(int uid, double total) {
		String hql = "select balance from Member where uid=" + uid;
		Query query = baseDao.getSession().createQuery(hql);
		List<Double> result = query.list();
		if(result.size()>0){
			return result.get(0) > total;
		}
		return false; 
	}

    @Override
    public List<MemberVO> getAllMember() {
        String hql = "select new edu.nju.dessert.vo.MemberVO(m.id,m.uid, m.level, m.mid, u.name, u.birth, u.sex, u.address,m.point, m.state) from Member m, User u where "
                + " m.uid=u.id and m.state!=3";
        Query query = baseDao.getSession().createQuery(hql);
        List<MemberVO> list = query.list();
        return list;
    }

    @Override
    public Double getMemberTotalCharge(int uid) {
        String hql = "select sum(value) from Payment where uid=" + uid;
        Query query = baseDao.getSession().createQuery(hql);
        Double result = (Double) query.uniqueResult();
        return result;
    }

    @Override
    public Double getMemberTotalConsumption(int uid) {
        String hql = "select sum(total) from Order where uid=" + uid;
        Query query = baseDao.getSession().createQuery(hql);
        Double result = (Double) query.uniqueResult();
        return result;
    }

}
