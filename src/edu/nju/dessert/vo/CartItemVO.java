package edu.nju.dessert.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CartItemVO {
	
	private int id;

	private int uid;
	
	private int dessertId;
	
	private String dessertName;

	private int storeId;
	
	private String storeName;
	
	private Date date;
	
	private int quantity;
	
	private double price;
	
	private double total;
	
	private int max;
	
	public CartItemVO(){}
	
	public CartItemVO(int id, int uid, int dessertId, String dessertName, 
			int storeId, String storeName, Date date, int quantity, double price, int max){
		this.id = id;
		this.uid = uid;
		this.dessertId = dessertId;
		this.dessertName = dessertName;
		this.storeId = storeId;
		this.storeName = storeName;
		this.quantity = quantity;
		this.price = price;
		this.date = date;
		this.total = quantity * price;
		this.max = max;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getDessertName() {
		return dessertName;
	}

	public void setDessertName(String dessertName) {
		this.dessertName = dessertName;
	}

	public int getDessertId() {
		return dessertId;
	}

	public void setDessertId(int dessertId) {
		this.dessertId = dessertId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public String getDate() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(date);
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}
	
}
