package edu.nju.dessert.vo;

import java.util.Date;

import edu.nju.dessert.util.DateTranslator;

public class PlanVO {

	private int id;
	
	private int store_id;
	
	private String storeName;
	
	private Date date;
	
	private int state;
	
	public PlanVO(){}
	
	public PlanVO(int id, int storeId, String storeName, Date date, int state){
		this.id = id;
		this.store_id = storeId;
		this.storeName = storeName;
		this.date = date;
		this.state = state;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public int getStore_id() {
		return store_id;
	}

	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getDate() {
		return DateTranslator.dateToStr(date);
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getState(){
		return state;
	}
	
	public void setState(int state) {
		this.state = state;
	}
	
	public String getStateStr(){
	    switch (state) {
        case 0:
            return "待审核";
        case 1:
            return "已审核";
        case 2:
            return "未通过";
        default: return "";
        }
	}

}
