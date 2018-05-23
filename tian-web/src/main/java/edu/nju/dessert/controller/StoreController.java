package edu.nju.dessert.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.nju.dessert.model.Dessert;
import edu.nju.dessert.model.Store;
import edu.nju.dessert.service.DessertService;
import edu.nju.dessert.service.StoreService;

@Controller
@RequestMapping(value={"/store","/stores"})
public class StoreController {

	@Autowired
	private StoreService storeService;

	@Autowired
	private DessertService dessertService;
	
	@RequestMapping(value="")
	public String index(ModelMap model){
		List<Store> stores = storeService.getAllStore();
		model.put("stores", stores);
		return "/store/index";
	}
	
	@RequestMapping(value="/{id}")
	public String store(@PathVariable int id, ModelMap model){
		Store store = storeService.getStore(id);
		List<Dessert> desserts = dessertService.getDessertList(0,6);
		model.put("desserts", desserts);
		model.put("store", store);
		return "/store/sdetail";
	}
	
}
