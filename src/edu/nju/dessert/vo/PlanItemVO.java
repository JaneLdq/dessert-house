package edu.nju.dessert.vo;

public class PlanItemVO {

    private int id;
    
	private int dessertId;
	
	private String dessertName;
	
	private int quantity;
	
	private double price;
	
	public PlanItemVO(){}
	
	public PlanItemVO(int id, int dessertId, String dessertName, int quantity, double price){
	    this.id = id;
	    this.dessertId = dessertId;
	    this.dessertName = dessertName;
	    this.quantity = quantity;
	    this.price = price;
	}

	public int getDessertId() {
		return dessertId;
	}

	public void setDessertId(int dessertId) {
		this.dessertId = dessertId;
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

    public String getDessertName() {
        return dessertName;
    }

    public void setDessertName(String dessertName) {
        this.dessertName = dessertName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
	
	
}
