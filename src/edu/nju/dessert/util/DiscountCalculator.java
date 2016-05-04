package edu.nju.dessert.util;

public class DiscountCalculator {

	public static double calDiscount(Double total, int level){
		double discount = 0;
		if(total == null || level == -1)
			return discount;
		switch(level){
		case 0:
			discount = 0;
			break;
		case 1:
			discount = total * 0.05;
			break;
		case 2:
			discount = total * 0.12;
			break;
		case 3:
			discount = total * 0.25;
			break;
		default:
			discount = 0;
		}
		return discount;
	}
	
	public static int calPoint(Double total){
		return (int) (total * 0.05);
	}
	
}
