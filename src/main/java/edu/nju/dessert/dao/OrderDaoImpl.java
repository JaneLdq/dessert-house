package edu.nju.dessert.dao;

import java.util.Date;
import java.util.List;

import org.aspectj.weaver.ast.Or;
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
		// TODO getOrders
		return null;
	}

	@Override
	public int saveOrder(int uid, int type,  int store_id, Date date, List<Cart> items, 
			int sendType, String remark, int addressId) {
		int state;
		if (sendType == 0) {
			state = 0;
		} else {
			state = 1;
			addressId = -1;
		}
		boolean result = true;
		double total = cartDao.getCartTotalSum(uid);
		double discount = DiscountCalculator.calDiscount(total, memberDao.getMemberLevel(uid));
		Order order = new Order(uid, type, date, (total-discount), discount, new Date(), store_id,
				sendType, remark, addressId);
		order.setState(state);
		result = baseDao.save(order);
		if(result){
			int orderId = order.getId();
			for(Cart c: items){
				OrderItem orderItem = new OrderItem();
				orderItem.setOrder_id(orderId);
				orderItem.setDessert_id(c.getDessert_id());
				orderItem.setQuantity(c.getQuantity());
				orderItem.setPrice(c.getPrice());
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
			return 0;
		}
		return 1;
	}

	@Override
	public int saveAgainOrder(int uid, int type, int store_id, Date date, List<OrderItemVO> items,
							  int sendType, String remark, int addressId, double total, double discount) {
		int state;
		if (sendType == 0) {
			state = 0;
		} else {
			state = 1;
		}
		boolean result = true;
		Order order = new Order(uid, type, date, total, discount, new Date(), store_id,
				sendType, remark, addressId);
		order.setState(state);
		result = baseDao.save(order);
		if(result){
			int orderId = order.getId();
			for(OrderItemVO vo: items){
				OrderItem orderItem = new OrderItem();
				orderItem.setOrder_id(orderId);
				orderItem.setDessert_id(vo.getDessertId());
				orderItem.setQuantity(vo.getQuantity());
				orderItem.setPrice(vo.getPrice());
				result = baseDao.save(orderItem);
				if(result){
					planDao.updateDessertRemain(vo.getDessertId(), store_id, vo.getQuantity(), date);
				}
			}
			if(!result) {
				this.deleteOrder(orderId);
			}else{
				memberDao.updateAccount(uid, total+discount, discount);
			}
		} else {
			return 0;
		}
		return 1;
	}

	@Override
	public boolean saveOrder(Order order) {
		boolean result = baseDao.update(order);
		baseDao.flush();
		return result;
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

	@Override
	public int getTotalOrdersPage(int uid, int size) {
		String hql = "select count(*) from Order where uid=" + uid;
		Query query = baseDao.getSession().createQuery(hql);
		Long count = (Long) query.uniqueResult();
		return calPages(count, size);
	}

	private int calPages(Long count, int size) {
		int pages = 0;
		if (size != 0)
			pages = (int) (count / size);
		if (pages % size != 0)
			pages = pages + 1;
		return pages;
	}

}
