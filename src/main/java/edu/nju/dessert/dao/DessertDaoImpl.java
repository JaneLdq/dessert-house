package edu.nju.dessert.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;

import edu.nju.dessert.model.Dessert;
import edu.nju.dessert.util.DateTranslator;

public class DessertDaoImpl implements DessertDao {

	private BaseDao baseDao;
	
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Dessert> getDessertList(int page, int size) {
		String hql = "from Dessert";
		Query query = baseDao.getSession().createQuery(hql);
		query.setFirstResult(page * size).setMaxResults(size);
		List<Dessert> result = query.list();
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Dessert getDessert(int id) {
		String hql = "from Dessert where id=" + id;
		Query query = baseDao.getSession().createQuery(hql);
		List<Dessert> result = query.list();
		if(result.size()<=0)
		    return null;
		return result.get(0);
	}

	@Override
	public Integer getDessertQuantity(int id, int storeId, String date) {
		String hql = "select pi.remain from Plan p, PlanItem pi where p.id = pi.plan_id and p.store_id="
				+ storeId + " and pi.dessert_id=" + id + " and p.date='" + date + "'";
		Query query = baseDao.getSession().createQuery(hql);
		Integer remain = (Integer) query.uniqueResult();
		return remain;
	}

	@Override
	public int getTotalPages(int size) {
		String hql = "select count(*) from Dessert";
		Query query = baseDao.getSession().createQuery(hql);
		Long count = (Long) query.uniqueResult();
		int pages = 0;
		if(size != 0)
			pages = (int) (count / size);
		if(pages % size != 0)
			pages = pages + 1;
		return pages;
	}

	@Override
	public Double getDessertPrice(int id, int storeId, String date) {
		String hql = "select pi.price from Plan p, PlanItem pi where p.store_id=" + storeId
				+ " and p.date='" + date + "' and pi.plan_id = p.id and pi.dessert_id=" + id; 
		Query query = baseDao.getSession().createQuery(hql);
		List<Double> list = query.list();
		Double price = 0.0;
		if(list.size()>0){
		    price = (Double) query.list().get(0);
		}
		return price;
	}

    @Override
    public Dessert checkDessert(int id, int storeId) {
        String hql = "from Dessert where id=" + id;
        Query query = baseDao.getSession().createQuery(hql);
        Dessert result = (Dessert) query.uniqueResult();
        if(result != null){
            hql = "select pi.price from Plan p, PlanItem pi where p.id = pi.plan_id and p.store_id=" + storeId
                    + " and p.date='" + DateTranslator.dateToStr(new Date()) + "'";
            query = baseDao.getSession().createQuery(hql);
            List<Double> list = query.list();
            if(list.size()>0)
                result.setPrice(list.get(0));
        }
        return result;
    }

	@Override
	public List<Dessert> getDessertByType(int type, int page, int num, int order, int store) {
		// TODO 根据排毒和类型筛选甜品 
		String hql = "from Dessert";
		if(type >=0 ){
			hql += " where type=" + type;
		}
		if(order == 1){
			hql += " order by sale_volume desc";
		}else if(order == 2){
			hql += " order by onshelf desc";
		}
		Query query = baseDao.getSession().createQuery(hql);
		query.setFirstResult(page * num).setMaxResults(num);
		List<Dessert> result = query.list();
		return result;
	}

}

