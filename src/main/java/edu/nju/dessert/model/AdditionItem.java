package edu.nju.dessert.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="addition_item")
public class AdditionItem {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private int cart_id;
	
	private Integer order_item_id;
	
	private String keyword;
	
	private String val;
	
	public AdditionItem(){}
	
	public AdditionItem(int cart_id, Integer order_item_id, String key, String value){
		this.cart_id = cart_id;
		this.keyword = key;
		this.val = value;
		this.order_item_id = order_item_id;
	}
	
	public AdditionItem(int cart_id, String key, String value){
		this.cart_id = cart_id;
		this.keyword = key;
		this.val = value;
		this.order_item_id = null;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public Integer getOrder_item_id() {
		return order_item_id;
	}

	public void setOrder_item_id(Integer order_item_id) {
		this.order_item_id = order_item_id;
	}
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getVal() {
		return val;
	}

	public void setVal(String val) {
		this.val = val;
	}
	
	
}
