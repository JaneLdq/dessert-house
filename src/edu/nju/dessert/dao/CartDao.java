package edu.nju.dessert.dao;

import java.util.Date;
import java.util.List;

import edu.nju.dessert.model.Cart;
import edu.nju.dessert.vo.CartItemVO;

public interface CartDao {
	
	public boolean removeDessert(int id, int quantity);
	
	public boolean deleteDessert(int id);
	
	public Long getCartTotalQuantity(int uid);
	
	public List<Cart> getCart(int uid);
	
	public List<CartItemVO> getCartItem(int uid);

	public Double getCartTotalSum(int uid);
	
	public Double getCartItemSum(int id);

	public boolean addDessert(int uid, int dessertId, int quantity, int storeId, Date date);

	public boolean updateDessert(int cid, int uid, int dessertId, int quantity, int storeId, Date date);
	
	public int clear(int uid);
	
	public int checkOverdue();
	
}
