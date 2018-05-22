package edu.nju.dessert.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.nju.dessert.model.Dessert;
import edu.nju.dessert.service.DessertService;

@Controller
@RequestMapping(value="")
public class IndexController {
	
	private DessertService dessertService;
	
	public void setDessertService(DessertService dessertService){
		this.dessertService = dessertService;
	}

	@RequestMapping(value="/index")
	public String index(ModelMap model){
		List<Dessert> hotDessert = dessertService.getHotDessert(8);
		List<Dessert> newDessert = dessertService.getNewDessert(4);
		model.put("hotList", hotDessert);
		model.put("newList", newDessert);
		return "index";
	}
	
	@RequestMapping(value="/index/staff")
	public String indexStaff(){
		return "index";
	}
	
}
