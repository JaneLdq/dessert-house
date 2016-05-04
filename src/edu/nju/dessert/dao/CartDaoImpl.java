package edu.nju.dessert.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.swing.plaf.basic.BasicInternalFrameTitlePane.SystemMenuBar;

import org.hibernate.Query;

import edu.nju.dessert.model.Cart;
import edu.nju.dessert.vo.CartItemVO;

public class CartDaoImpl implements CartDao {

	private BaseDao baseDao;
	
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	@Override
	public boolean removeDessert(int id, int quantity) {
		String hql= "update Cart cart set quantity = quantity - " + quantity + " where cart.id =" + id;
		Query query = baseDao.getSession().createQuery(hql);
		int result = query.executeUpdate();
		if( result <= 0){
			return false;
		}
		return true;
	}

	@Override
	public boolean addDessert(int uid, int dessertId, int quantity, int storeId, Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dateStr = sdf.format(date);
		String hql= "update Cart cart set quantity = quantity + " + quantity + " where user_id =" + uid 
				+ " and dessert_id=" + dessertId + " and store_id=" + storeId + " and date='" + dateStr +"'";
		Query query = baseDao.getSession().createQuery(hql);
		int result = query.executeUpdate();
		if( result <= 0){
			return baseDao.save(new Cart(uid, dessertId, quantity, storeId, date));
		}
		return true;
	}

	@Override
	public boolean deleteDessert(int id) {
		String hql = "delete Cart where id=" + id;
		Query query = baseDao.getSession().createQuery(hql);
		int result =query.executeUpdate();
		if( result <= 0)
			return false;
		return true;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CartItemVO> getCartItem(int uid) {
		this.checkOverdue();
		String hql = "select new edu.nju.dessert.vo.CartItemVO(c.id, c.user_id, c.dessert_id, d.name,"
				+ " s.id, s.name, c.date, c.quantity, d.price, pi.remain)"
				+ " from Cart c, Dessert d, Store s , Plan p, PlanItem pi where user_id=" + uid
				+ " and c.dessert_id = d.id and c.store_id = s.id and p.date=c.date "
				+ " and pi.dessert_id = c.dessert_id and pi.plan_id = p.id and p.store_id =c.store_id";
		Query query = baseDao.getSession().createQuery(hql);
		List<CartItemVO> items = query.list();
		for(CartItemVO c: items){
			if(c.getMax() < c.getQuantity()){
				c.setQuantity(c.getMax());
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date date = null;
				try {
					date = sdf.parse(c.getDate());
				} catch (ParseException e) {
					e.printStackTrace();
				}
				this.updateDessert(c.getId(),c.getUid(), c.getDessertId(), c.getQuantity(), c.getStoreId(), date);
			}
		}
		return items;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Long getCartTotalQuantity(int uid) {
		String hql = "select sum(quantity) from Cart where user_id=" + uid;
		Query query = baseDao.getSession().createQuery(hql);
		List<Long> list = query.list();
		return list.get(0);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Double getCartTotalSum(int uid){
		String hql = "select sum(d.price* c.quantity) from Cart c, Dessert d where c.user_id=" + uid
				+ " and c.dessert_id=d.id";
		Query query = baseDao.getSession().createQuery(hql);
		List<Double> list = query.list();
		return list.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Double getCartItemSum(int id) {
		String hql = "select sum(d.price*c.quantity) from Cart c, Dessert d where c.id=" + id
				+ " and c.dessert_id = d.id";
		Query query = baseDao.getSession().createQuery(hql);
		List<Double> list = query.list();
		return list.get(0);
	}

	@Override
	public boolean updateDessert(int cid, int uid, int dessertId, int quantity, int storeId, Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dateStr = sdf.format(date);
		String hql ="select id from Cart where user_id=" + uid + " and store_id=" + 
				storeId + " and date='" + dateStr + "' and dessert_id=" + dessertId;
		Query query = baseDao.getSession().createQuery(hql);
		List<Integer> items = query.list();
		if(items.size()>0 && items.get(0) != cid ){
			return false;
		}else{
			hql = "update Cart set quantity=" + quantity + ", date='" + dateStr + "'"
					+ " where id=" + cid;
			query = baseDao.getSession().createQuery(hql);
			int result = query.executeUpdate();
			if( result <= 0){
					return false;
			}
			return true;
		}
	}

	@Override
	public List<Cart> getCart(int uid) {
		String hql = "from Cart where user_id=" + uid;
		Query query = baseDao.getSession().createQuery(hql);
		List<Cart> list = query.list();
		return list;
	}

	@Override
	public int clear(int uid) {
		String hql = "delete from Cart where user_id = " + uid;
		Query query = baseDao.getSession().createQuery(hql);
		int result = query.executeUpdate();
		return result;
	}

	@Override
	public int checkOverdue() {
		String sql = "delete from cart where date < CURRENT_DATE" ;
		Query query = baseDao.getSession().createSQLQuery(sql);
		int result = query.executeUpdate();
		System.out.println(result);
		return result;
	}
	
}
