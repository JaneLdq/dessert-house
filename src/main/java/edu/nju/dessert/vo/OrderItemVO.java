package edu.nju.dessert.vo;

import java.util.List;

public class OrderItemVO {

    private int id;
    
    private int dessertId;
    
    private int quantity;
    
    private String name;
    
    private double price;
    
    private List<AdditionItemVO> additions;
    
    public OrderItemVO(){}
    
    public OrderItemVO(int id, int dessertId, int quantity, String name, double price){
        this.id = id;
        this.dessertId = dessertId;
        this.quantity = quantity;
        this.name = name;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDessertId() {
        return dessertId;
    }

    public void setDessertId(int dessertId) {
        this.dessertId = dessertId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

	public List<AdditionItemVO> getAdditions() {
		return additions;
	}

	public void setAdditions(List<AdditionItemVO> additions) {
		this.additions = additions;
	}
    
    
    
    
}
