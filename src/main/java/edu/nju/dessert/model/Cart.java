package edu.nju.dessert.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Cart {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private int user_id;
	
	private int dessert_id;
	
	private int quantity;
	
	private int store_id;
	
	private Date date;

	public Cart(){}
	
	public Cart(int uid, int dessertId, int quantity, int storeId, Date date){
		this.user_id = uid;
		this.dessert_id = dessertId;
		this.quantity = quantity;
		this.store_id = storeId;
		this.date = date;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getDessert_id() {
		return dessert_id;
	}

	public void setDessert_id(int dessert_id) {
		this.dessert_id = dessert_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getStore_id() {
		return store_id;
	}

	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
}
