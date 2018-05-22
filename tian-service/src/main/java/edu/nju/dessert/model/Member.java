package edu.nju.dessert.model;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Member {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String mid;
	
	private int uid;
	
	private int level;
	
	private int point;
	
	private int state;
	
	private String bank_card;
	
	private String payword;
	
	private double balance;
	
	private Date suspend_time;
	
	private Date active_time;
	
	public Member(){}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getBank_card() {
		return bank_card;
	}

	public void setBank_card(String bank_card) {
		this.bank_card = bank_card;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public Date getSuspend_time() {
		return suspend_time;
	}

	public void setSuspend_time(Date suspend_time) {
		this.suspend_time = suspend_time;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getPayword() {
		return payword;
	}

	public void setPayword(String payword) {
		this.payword = payword;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getActive_time() {
		return active_time;
	}

	public void setActive_time(Date active_time) {
		this.active_time = active_time;
	}
	
	public String getValidity(){
		if(state != 0){
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			if(active_time != null){
    			String validity = df.format(new Date(active_time.getTime() + (long)365 * 24 * 60 * 60 * 1000));
    			return validity;
			}
		}
		return "-";
	}
	
}
