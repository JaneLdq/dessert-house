package edu.nju.dessert.vo;

import java.util.Date;
import java.util.List;

import edu.nju.dessert.util.DateTranslator;

public class OrderVO {

    private int id;
    
    private int storeId;
    
    private Date date;
    
    private Date sendDate;
    
    private String mid;
    
    private String memberName;
    
    private double total;
    
    private double discount;
    
    private List<OrderItemVO> items;
    
    public OrderVO(){}
    
    public OrderVO(int id, int storeId, Date date, Date sendDate, String mid, String memberName, double total, double discount,
            List<OrderItemVO> items){
        this.id = id;
        this.storeId = storeId;
        this.date = date;
        this.sendDate = sendDate;
        this.mid = mid;
        this.memberName = memberName;
        this.total = total;
        this.discount = discount;
        this.items = items;
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

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
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

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public List<OrderItemVO> getItems() {
        return items;
    }

    public void setItems(List<OrderItemVO> items) {
        this.items = items;
    }

    public int getStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }

    public String getSendDate() {
        return DateTranslator.dateToStr(sendDate);
    }

    public void setSendDate(Date sendDate) {
        this.sendDate = sendDate;
    }
    
    
}
