package edu.nju.dessert.vo;

import java.util.Date;
import java.util.List;

import edu.nju.dessert.model.Address;
import edu.nju.dessert.model.Store;
import edu.nju.dessert.util.DateTranslator;

public class OrderVO {

    private int id;
    
    private Date date;
    
    private Date sendDate;
    
    private String mid;
    
    private String memberName;
    
    private double total;
    
    private double discount;

    private int sendType;

    private int state;
    
    private List<OrderItemVO> items;

    private Store store;

    private Address address;
    
    public OrderVO(){}
    
    public OrderVO(int id, Date date, Date sendDate, String mid, String memberName, double total, double discount,
            int sendType, int state, Store store, Address address, List<OrderItemVO> items){
        this.id = id;
        this.date = date;
        this.sendDate = sendDate;
        this.mid = mid;
        this.memberName = memberName;
        this.total = total;
        this.discount = discount;
        this.items = items;
        this.sendType = sendType;
        this.state = state;
        this.store = store;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return DateTranslator.datetimeToStr(date);
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getSendDate() {
        return DateTranslator.dateToStr(sendDate);
    }

    public void setSendDate(Date sendDate) {
        this.sendDate = sendDate;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getSendType() {
        return sendType;
    }

    public void setSendType(int sendType) {
        this.sendType = sendType;
    }

    public String getState() {
        switch (state) {
            case 0: return "未派送";
            case 1: return "未取货";
            case 2: return "已完成";
            case 3: return "已退订";
        }
        return "-";
    }

    public void setState(int state) {
        this.state = state;
    }

    public List<OrderItemVO> getItems() {
        return items;
    }

    public void setItems(List<OrderItemVO> items) {
        this.items = items;
    }

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

}
