package edu.nju.dessert.service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.transaction.annotation.Transactional;

import edu.nju.dessert.dao.CartDao;
import edu.nju.dessert.dao.DessertDao;
import edu.nju.dessert.dao.MemberDao;
import edu.nju.dessert.dao.OrderDao;
import edu.nju.dessert.model.Cart;
import edu.nju.dessert.model.Member;
import edu.nju.dessert.model.Order;
import edu.nju.dessert.model.OrderItem;
import edu.nju.dessert.util.DateTranslator;
import edu.nju.dessert.util.DiscountCalculator;
import edu.nju.dessert.vo.AdditionItemVO;
import edu.nju.dessert.vo.CartItemVO;
import edu.nju.dessert.vo.OrderItemVO;

public class TradeServiceImpl implements TradeService {

	private CartDao cartDao;
	
	private MemberDao memberDao;
	
	private OrderDao orderDao;
	
	private DessertDao dessertDao;
	
	public void setDessertDao(DessertDao dessertDao) {
        this.dessertDao = dessertDao;
    }
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}
	
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}
	
	@Override
	public Double updateCartItem(int id, int uid, int dessertId, int quantity,int storeId, Date date){
		boolean result = cartDao.updateDessert(id, uid, dessertId, quantity, storeId, date);
		Double total = null;
		if(result){
			total = cartDao.getCartItemSum(id);
		}
		return total;
	}
	
	@Override
	public Double removeCartItem(int id, int quantity) {
		boolean result = cartDao.removeDessert(id, quantity);
		Double total = null;
		if(result){
			total = cartDao.getCartItemSum(id);
		}
		return total;
	};

	@Override
	public boolean deleteCartItem(int id) {
		return cartDao.deleteDessert(id);
	}

	@Override
	public Long getCartTotalQuantity(int uid) {
		return cartDao.getCartTotalQuantity(uid);
	}

	@Override
	public Map<String, String> getCartSum(int uid) {
		Map<String, String> map = new HashMap<>();
		Double sum = cartDao.getCartTotalSum(uid);
		double discount = DiscountCalculator.calDiscount(sum, memberDao.getMemberLevel(uid));
		map.put("discount", new DecimalFormat("#.0").format(discount));		
		if(sum == null){ 
			map.put("sum", ".0");
		}else{
			map.put("sum", new DecimalFormat("#.0").format(sum-discount));
		}
		return map;
	}

	@Override
	public List<CartItemVO> getCartItem(int uid) {
		return cartDao.getCartItem(uid);
	}

	@Override
	public boolean addCartItem(int uid, int dessertId, int quantity, int storeId, Date date, List<AdditionItemVO> additions) {
		boolean result = cartDao.addDessert(uid, dessertId, quantity, storeId, date, additions);
		return result;
	}

	@Override
	@Transactional
	public int book(int uid, String remark, int sendType, int addressId) {
		// TODO 将购物车里的全部商品创建订单，需要处理新增的AdditionItem部分
		int result = 1;
		double sum = cartDao.getCartTotalSum(uid);
		double discount = DiscountCalculator.calDiscount(sum, memberDao.getMemberLevel(uid));
		boolean enough = memberDao.checkBalance(uid, sum-discount);
		if(enough){
			List<Cart> items = cartDao.getCart(uid);
			Map<String, List<Cart>> orders = splitCart(items);
			Iterator<Entry<String, List<Cart>>> iter = orders.entrySet().iterator();
			while (iter.hasNext()) {
				Entry<String, List<Cart>> order = (Entry<String, List<Cart>>) iter.next();
				List<Cart> orderItem = order.getValue();
				result = orderDao.saveOrder(uid, 1, orderItem.get(0).getStore_id(), orderItem.get(0).getDate(), orderItem, 
						sendType, remark, addressId);
			}
		} else{
			result = 2;
		}
		return result;
	}
	
	private Map<String, List<Cart>> splitCart(List<Cart> items) {
		Map<String, List<Cart>> map = new HashMap<String, List<Cart>>();
		for(Cart c: items){
			List<Cart> list = map.get(c.getStore_id() + "-" + c.getDate());
			if(list == null){
				list = new ArrayList<Cart>();
			}
			list.add(c);
			map.put(c.getStore_id() + "-" + c.getDate(), list);
		}
		return map;
	}

	@Override
	@Transactional
	public int checkOverdue() {
		return cartDao.checkOverdue();
	}

    @Override
    public boolean sale(Integer storeId, String mid, List<OrderItemVO> items) {
        Member member = memberDao.getMemberByMid(mid);
        int uid = 0;
        double discount = 0.0;
        double total = 0;
        Date date = new Date();
        List<OrderItem> list = new ArrayList<OrderItem>();
        for(OrderItemVO item: items){
            double price = dessertDao.getDessertPrice(item.getDessertId(), storeId, DateTranslator.dateToStr(date));
            OrderItem oItem = new OrderItem();
            oItem.setDessert_id(item.getDessertId());
            oItem.setQuantity(item.getQuantity());
            oItem.setPrice(price);
            list.add(oItem);
            total += (price * item.getQuantity());
        }
        if(member != null){
            uid = member.getUid();
            discount = DiscountCalculator.calDiscount(total, member.getLevel());
        }
        Order order = new Order(uid, 0, date, total-discount, discount, date, storeId, 1, "", -1);
		order.setState(2);
        boolean result = orderDao.saveSaleOrder(order, list);
        return result;
    }

}
