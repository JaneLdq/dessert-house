package edu.nju.dessert.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;

import edu.nju.dessert.model.Cart;
import edu.nju.dessert.model.Order;
import edu.nju.dessert.model.OrderItem;
import edu.nju.dessert.util.DateTranslator;
import edu.nju.dessert.util.DiscountCalculator;
import edu.nju.dessert.vo.OrderItemVO;

public class OrderDaoImpl implements OrderDao {

	private BaseDao baseDao;
	
	private CartDao cartDao;
	
	private MemberDao memberDao;
	
	private DessertDao dessertDao;
	
	private PlanDao planDao;
	
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	public void setDessertDao(DessertDao dessertDao) {
		this.dessertDao = dessertDao;
	}
	
	public void setPlanDao(PlanDao planDao) {
		this.planDao = planDao;
	}
	
	@Override
	public List<Order> getOrders(int uid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int saveOrder(int uid, int type,  int store_id, Date date, List<Cart> items) {
		int state = 1;
		boolean result = true;
		double total = cartDao.getCartTotalSum(uid);
		double discount = DiscountCalculator.calDiscount(total, memberDao.getMemberLevel(uid));
		Order order = new Order(uid, type, date, (total-discount), discount, new Date(), store_id);
		result = baseDao.save(order);
		if(result){
			int orderId = order.getId();
			for(Cart c: items){
				OrderItem orderItem = new OrderItem();
				double price = dessertDao.getDessertPrice(c.getDessert_id(), store_id, DateTranslator.dateToStr(date));
				orderItem.setOrder_id(orderId);
				orderItem.setDessert_id(c.getDessert_id());
				orderItem.setQuantity(c.getQuantity());
				orderItem.setPrice(price);
				result = baseDao.save(orderItem);
				if(result){
					cartDao.deleteDessert(c.getId());
					planDao.updateDessertRemain(c.getDessert_id(), store_id, c.getQuantity(), c.getDate());
				}
			}
			if(!result){
				this.deleteOrder(orderId);
			}else{
				memberDao.updateAccount(uid, total, discount);
			}
		} else {
			state = 0;
		}
		return state;
	}

	@Override
	public boolean deleteOrder(int id) {
		String hql = "delete from Order where id=" + id;
		Query query = baseDao.getSession().createQuery(hql);
		int result = query.executeUpdate();
		if(result > 0)
			return true;
		return false;
	}

    @Override
    public boolean saveSaleOrder(Order order, List<OrderItem> list) {
        boolean result = baseDao.save(order);
        int oid = order.getId();
        if(result){
            for(OrderItem oi: list){
                oi.setOrder_id(oid);
                result = baseDao.save(oi);
                if(result){
                    planDao.updateDessertRemain(oi.getDessert_id(), order.getStore_id(), oi.getQuantity(), order.getSend_date());
                }
            }
            if(order.getUid()>0){
                memberDao.updateAccount(order.getUid(), order.getTotal()+order.getDiscount(), order.getDiscount());
            }
        }
        return result;
    }

    @Override
    public List<Order> getOrderByStore(int storeId, int type) {
        String hql = "";
        if(storeId == 0){
            hql = "from Order where type=" + type; 
        }else{
            hql = "from Order where store_id=" + storeId + " and type=" + type;   
        }
        Query query = baseDao.getSession().createQuery(hql);
        List<Order> list = query.list();
        return list;
    }

    @Override
    public Order getOrderById(int id) {
        String hql = "from Order where id=" + id;
        Query query = baseDao.getSession().createQuery(hql);
        List<Order> orders = query.list();
        if(orders.size()>0)
            return orders.get(0);
        return null;
    }

    @Override
    public List<OrderItemVO> getOrderItemByOrderId(int id) {
        String hql = "select new edu.nju.dessert.vo.OrderItemVO(oi.id, oi.dessert_id, oi.quantity,"
                + "d.name,oi.price) from OrderItem oi, Dessert d where oi.dessert_id = d.id and oi.order_id=" + id;
        Query query = baseDao.getSession().createQuery(hql);
        List<OrderItemVO> result = query.list();
        return result;
    }

    @Override
    public List<Order> getOrderByUser(int uid) {
        String hql = "from Order where uid=" + uid;
        Query query = baseDao.getSession().createQuery(hql);
        List<Order> list = query.list();
        return list;
    }

    @Override
    public List<Order> getOrderByUserPage(int uid, int page, int size) {
        String hql = "from Order where uid=" + uid + " order by created_at desc";
        Query query = baseDao.getSession().createQuery(hql);
        query.setFirstResult(page * size).setMaxResults(size);
        List<Order> orders = query.list();
        return orders;
    }
    

}
