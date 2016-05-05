package edu.nju.dessert.dao;

import java.util.Date;
import java.util.List;

import edu.nju.dessert.model.Cart;
import edu.nju.dessert.model.Order;
import edu.nju.dessert.model.OrderItem;
import edu.nju.dessert.vo.OrderItemVO;

public interface OrderDao {

	public List<Order> getOrders(int uid);
	
	/**
	 * @return 1成功 0订单保存出错 
	 */
	public int saveOrder(int uid, int type, int store_id, Date date, List<Cart> items);
	
	public boolean deleteOrder(int id);

    public boolean saveSaleOrder(Order order, List<OrderItem> list);

    public List<Order> getOrderByStore(int storeId, int type);
    
    public Order getOrderById(int id);
    
    public List<OrderItemVO> getOrderItemByOrderId(int id);

    public List<Order> getOrderByUser(int uid);

    public List<Order> getOrderByUserPage(int uid, int page, int size);
	
}