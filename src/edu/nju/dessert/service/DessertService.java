package edu.nju.dessert.service;

import java.util.List;

import edu.nju.dessert.model.Dessert;

public interface DessertService {

	public List<Dessert> getDessertList(int page);
	
	public Dessert getDessert(int id);
	
	public int getDessertQuantity(int id, int storeId, String date);
	
	public int getTotalPage();
	
    public Dessert checkDessert(int id, int storeId);
	
}
