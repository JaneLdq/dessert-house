package edu.nju.dessert.vo;

import java.util.List;

public class CartItemAddVO {

	private List<AdditionItemVO> additions;
	
	private int dessertId;
	
	private int storeId;
	
	private int quantity;
	
	private String dateStr;
	
	public CartItemAddVO(){}
	
	public CartItemAddVO(int dessertId, int storeId, int quantity, String dateStr, List<AdditionItemVO> additions){
		this.additions = additions;
		this.dessertId = dessertId;
		this.storeId = storeId;
		this.dateStr = dateStr;
	}

	public List<AdditionItemVO> getAdditions() {
		return additions;
	}

	public void setAdditions(List<AdditionItemVO> additions) {
		this.additions = additions;
	}

	public int getDessertId() {
		return dessertId;
	}

	public void setDessertId(int dessertId) {
		this.dessertId = dessertId;
	}

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDateStr() {
		return dateStr;
	}

	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}
	
}
