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
		String hql = "from Dessert";
		if(type >=0 ){
			hql += " where type=" + type;
		}
		if(order == 2){
			hql += " order by onshelf desc";
		}
        if(order ==1){
//            hql = "select dessert.* from dessert left join(\n" +
//                    "select dessert_id,sum(quantity) s1 from order_item where order_id in(\n" +
//                    "select id from sorder where sorder.store_id = '1'\n" +
//                    ")\n" +
//                    "group by dessert_id\n" +
//                    ") a2 on dessert.id = a2.dessert_id\n" +
//                    "where type=\"0\"\n" +
//                    "order by s1 desc,id\n";
        	hql = "select dessert.id,dessert.`name`,dessert.`desc`,dessert.price,dessert.picture,dessert.type,dessert.onshelf from dessert left join(\n" +
					"select dessert_id,sum(quantity) s1 from order_item where order_id in(\n" +
					"select id from sorder where sorder.store_id = "+store+
					")\n" +
					"group by dessert_id\n" +
					") a2 on dessert.id = a2.dessert_id\n";
        	if(type >= 0){
					hql += "where type="+type;
        	}
			hql += " order by s1 desc, id\n";
			Query query = baseDao.getSession().createSQLQuery(hql).addEntity(Dessert.class);
			query.setFirstResult(page * num).setMaxResults(num);
			List<Dessert> result = (List<Dessert>) query.list();
			return result;
        }
		Query query = baseDao.getSession().createQuery(hql);
		query.setFirstResult(page * num).setMaxResults(num);
		List<Dessert> result = query.list();
		return result;
	}

	@Override
	public List<Dessert> search(String key, int type) {
		String hql = "from Dessert where name like '%" + key + "%'";
		if(type >=0 && type <=5){
			hql += " and type=" + type;
		}
		Query query = baseDao.getSession().createQuery(hql);
		List<Dessert> result = query.list();
		return result;
	}

	@Override
	public List<Dessert> getHotDessert(int num) {
		// TODO 按销量排
		String hql = "from Dessert order by onshelf desc";
		Query query = baseDao.getSession().createQuery(hql);
		query.setMaxResults(num);
		List<Dessert> result = query.list();
		return result;
	}

	@Override
	public List<Dessert> getNewDessert(int num) {
		String hql = "from Dessert order by onshelf desc";
		Query query = baseDao.getSession().createQuery(hql);
		query.setMaxResults(num);
		List<Dessert> result = query.list();
		return result;
	}

	@Override
	public Long getTotalDessertNum() {
		String hql="select count(id) from Dessert";
		Query query = baseDao.getSession().createQuery(hql);
		Long count=(Long)query.uniqueResult();
		return count;
	}

}

