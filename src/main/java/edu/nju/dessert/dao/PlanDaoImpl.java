package edu.nju.dessert.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;

import edu.nju.dessert.model.Plan;
import edu.nju.dessert.model.PlanItem;
import edu.nju.dessert.util.DateTranslator;
import edu.nju.dessert.vo.PlanItemVO;
import edu.nju.dessert.vo.PlanUpdatorVO;
import edu.nju.dessert.vo.PlanVO;

public class PlanDaoImpl implements PlanDao {
	
	private BaseDao baseDao;
	
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public boolean updateDessertRemain(int dessertId, int storeId, int quantity, Date date) {
		String sql = "update plan_item pi inner join plan p on pi.plan_id = p.id"
				+ " set pi.remain=pi.remain-" + quantity + " where p.store_id="+ storeId 
				+ " and pi.dessert_id=" + dessertId
				+ " and p.date='" + DateTranslator.dateToStr(date) +"'";
		Query query = baseDao.getSession().createSQLQuery(sql);
		int result = query.executeUpdate();
		if(result > 0)
			return true;
		return false;
	}

	@Override
	public List<PlanVO> getPlanByStoreId(int sid) {
		String hql = "select new PlanVO(p.id, p.store_id, s.name, p.date, p.state)"
				+ " from Plan p, Store s where p.store_id = s.id and s.id=" + sid + "order by p.date desc";
		Query query = baseDao.getSession().createQuery(hql);
		List<PlanVO> result = query.list();
		return result;
	}

	@Override
	public List<PlanVO> getAllPlan() {
		String hql = "select new PlanVO(p.id, p.store_id, s.name, p.date, p.state)"
				+ " from Plan p, Store s where p.store_id = s.id order by p.date desc";
		Query query = baseDao.getSession().createQuery(hql);
		List<PlanVO> list = query.list();
		System.out.println("plans: "+ list.size());
		return list;
	}

	@Override
	public Date getLatestDate(int sid) {
		String hql = "select max(date) from Plan where store_id=" + sid;
		Query query = baseDao.getSession().createQuery(hql);
		Date result = (Date) query.uniqueResult();
		return result;
	}

	@Override
	public int addPlan(int sid, String date) {
		String hql = "from Plan where store_id=" + sid + " and date='" + date + "'";
		String hql2 = "select id from Plan where store_id=" + sid + " and date='" + date + "'";
		Query query = baseDao.getSession().createQuery(hql);
		Query query2 = baseDao.getSession().createQuery(hql2);
		List<Plan> list = query.list();
		Integer id = null;
		if(list.size()==0){
			Plan plan = new Plan();
			plan.setStore_id(sid);
			plan.setDate(DateTranslator.strToDate(date));
			plan.setState(0);
			baseDao.save(plan);
			id = (Integer) query2.uniqueResult();
			if(id != null)
				return id;
		}
		return 0;
	}

	@Override
	public boolean addPlanItem(int plan_id, int store_id, List<PlanItemVO> items) {
		boolean result = true;
		for(PlanItemVO vo: items){
			PlanItem pi = new PlanItem(plan_id, store_id, vo.getDessertId(),vo.getQuantity(),
					vo.getPrice());
			result = baseDao.save(pi);
		}
		return result;
	}

    @Override
    public PlanVO getPlanById(int pid) {
        String hql = "select new PlanVO(p.id, p.store_id, s.name, p.date, p.state)"
                + " from Plan p, Store s where p.store_id = s.id and p.id=" + pid;
        Query query = baseDao.getSession().createQuery(hql);
        PlanVO plan = (PlanVO) query.uniqueResult();
        return plan;
    }

    @Override
    public List<PlanItemVO> getPlanItemByPlanId(int pid) {
        String hql = "select new PlanItemVO(pi.id, pi.dessert_id, d.name, pi.quantity, pi.price)"
                + " from PlanItem pi, Plan p, Dessert d where pi.plan_id = p.id and pi.dessert_id = d.id "
                + " and p.id =" + pid;
        Query query = baseDao.getSession().createQuery(hql);
        List<PlanItemVO> result = query.list();
        return result;
    }

    @Override
    public boolean updatePlan(PlanUpdatorVO plan) {
        boolean result = true;
        String hql = "update Plan set state=0 where id=" + plan.getPid();
        Query query = baseDao.getSession().createQuery(hql);
        result = query.executeUpdate()==1 ? true : false;
        if(result){
            hql = "update PlanItem set quantity=?, price=?, remain=? where id=?";
            query = baseDao.getSession().createQuery(hql);
            for(PlanItemVO vo: plan.getItems()){
                query.setInteger(0, vo.getQuantity());
                query.setDouble(1, vo.getPrice());
                query.setInteger(2, vo.getQuantity());
                query.setInteger(3, vo.getId());
                int row = query.executeUpdate();
                if(row == 1){
                    result = true;
                } else {
                    result = false;
                }
            }
        }
        return result;
    }

    @Override
    public boolean passPlan(int id) {
        String hql = "update Plan set state=1 where id=" + id;
        Query query = baseDao.getSession().createQuery(hql);
        int result = query.executeUpdate();
        if(result == 1)
            return true;
        return false;
    }

    @Override
    public boolean rejectPlan(int id) {
        String hql = "update Plan set state=2 where id=" + id;
        Query query = baseDao.getSession().createQuery(hql);
        int result = query.executeUpdate();
        if(result == 1)
            return true;
        return false;
    }

    @Override
    public Long getTotalNum() {
        String hql = "select count(*) from Plan";
        Query query = baseDao.getSession().createQuery(hql);
        Long result = (Long) query.uniqueResult();
        if(result != null)
            return result;
        return (long) 0;
    }


}
