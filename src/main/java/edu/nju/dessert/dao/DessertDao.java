package edu.nju.dessert.dao;

import java.util.List;

import edu.nju.dessert.model.Dessert;

public interface DessertDao {

	public List<Dessert> getDessertList(int page, int size);
	
	public Dessert getDessert(int id);
	
	public Integer getDessertQuantity(int id, int storeId, String date);
	
	public int getTotalPages(int size);
	
	public Double getDessertPrice(int id, int storeId, String date);

    public Dessert checkDessert(int id, int storeId);
	
}
