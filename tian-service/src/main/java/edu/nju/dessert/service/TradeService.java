package edu.nju.dessert.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import edu.nju.dessert.vo.AdditionItemVO;
import edu.nju.dessert.vo.CartItemVO;
import edu.nju.dessert.vo.OrderItemVO;

public interface TradeService {
	
	public List<CartItemVO> getCartItem(int uid);
	
	public Double removeCartItem(int uid, int quantity);
	
	public boolean deleteCartItem(int id);
	
	public Long getCartTotalQuantity(int uid);
	
	public Map<String, String> getCartSum(int uid);

	public Double updateCartItem(int cid, int uid, int dessertId, int quantity, int storeId, Date date);
	
	public boolean addCartItem(int uid, int dessertId, int quantity, int storeId, Date date, List<AdditionItemVO> additions);

	/**
	 * 创建订单
	 * @param uid 用户ID
	 * @param remark 备注
	 * @param type 类型（送货=0. 自提=1）
	 * @return
	 */
	public int book(int uid, String remark, int type, int addressId);
	
	public int checkOverdue();
	
	public boolean sale(Integer storeId, String mid, List<OrderItemVO> items);
	
	public double getPrice(int dessertId, List<AdditionItemVO> additions);
}
