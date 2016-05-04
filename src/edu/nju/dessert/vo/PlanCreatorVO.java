package edu.nju.dessert.vo;

import java.util.List;

public class PlanCreatorVO {

	private int sid;
	
	private String date;
	
	private List<PlanItemVO> items;
	
	public PlanCreatorVO(){}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public List<PlanItemVO> getItems() {
		return items;
	}

	public void setItems(List<PlanItemVO> items) {
		this.items = items;
	}
		
}
