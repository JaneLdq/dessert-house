package edu.nju.dessert.vo;

import java.util.List;

public class OrderCreatorVO {

    private String mid;
    
    private List<OrderItemVO> items;
    
    public OrderCreatorVO(){}

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public List<OrderItemVO> getItems() {
        return items;
    }

    public void setItems(List<OrderItemVO> items) {
        this.items = items;
    }
    
}
