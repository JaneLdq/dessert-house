package edu.nju.dessert.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="plan_item")
public class PlanItem {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private int plan_id;
	
	private int store_id;
	
	private int dessert_id;
	
	private int quantity;
	
	private double price;
	
	private int remain;

	public PlanItem(){}
	
	public PlanItem(int plan_id, int store_id, int dessert_id, int quantity, double price){
		this.plan_id = plan_id;
		this.store_id = store_id;
		this.dessert_id = dessert_id;
		this.quantity = quantity;
		this.price = price;
		this.remain = quantity;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPlan_id() {
		return plan_id;
	}

	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}

	public int getStore_id() {
		return store_id;
	}

	public void setStore_id(int store_id) {
		this.store_id = store_id;
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

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getRemain() {
		return remain;
	}

	public void setRemain(int remain) {
		this.remain = remain;
	}

}
