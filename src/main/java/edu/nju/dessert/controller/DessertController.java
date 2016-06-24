package edu.nju.dessert.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.nju.dessert.interceptor.Auth;
import edu.nju.dessert.interceptor.Role;
import edu.nju.dessert.model.Dessert;
import edu.nju.dessert.model.Store;
import edu.nju.dessert.service.DessertService;
import edu.nju.dessert.service.StoreService;

@Controller
@RequestMapping(value={"/dessert","/desserts"})
public class DessertController {
	
	private DessertService dessertService;
	
	private StoreService storeService;
	
	public void setDessertService(DessertService dessertService) {
		this.dessertService = dessertService;
	}
	
	public void setStoreService(StoreService storeService) {
		this.storeService = storeService;
	}
	
	
	@RequestMapping(value="")
	public String index(ModelMap model){
		List<Dessert> desserts = dessertService.getDessertList(0,6);
		model.put("desserts", desserts);
		int maxPage = dessertService.getTotalPage();
		model.put("pre", -1);
        if(1<maxPage){
            model.put("next", 1);
        }else{
            model.put("next", -1);
        }
		return "/dessert/index";
	}
	
	@RequestMapping(value="/getDessert", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> getDessertByPageType(ModelMap model, @RequestParam(value="type", defaultValue="-1", required=false) int type, 
			@RequestParam("page") int page, @RequestParam("num") int num, @RequestParam(value="order", defaultValue="0", required=false) int order,
			@RequestParam("storeId") int store){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Dessert> result = dessertService.getDessertByType(type, page, num, order, store);
		map.put("result", result);
		return map;
	}
	
	/**
	 * 获取所有甜品
	 * @param model
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/{page}")
	public String getByPage(ModelMap model, @PathVariable int page){
		List<Dessert> desserts = dessertService.getDessertList(page, 6);
		model.put("desserts", desserts);
		model.put("pre", page-1);
		int maxPage = dessertService.getTotalPage();
		if((page+1)<maxPage){
			model.put("next", page+1);
		}else{
			model.put("next", -1);
		}
		return "/dessert/index";
	}
	
	/**
	 * 获取甜品详情
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/d/{id}", method=RequestMethod.GET)
	public String detail(@PathVariable int id, ModelMap model){
		Dessert dessert = dessertService.getDessert(id);
		List<Store> stores = storeService.getAllStore();
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");  
	    String minDate = df.format(new Date(date.getTime() + 1 * 24 * 60 * 60 * 1000));
	    String maxDate = df.format(new Date(date.getTime() + 7 * 24 * 60 * 60 * 1000));
		int quantity = dessertService.getDessertQuantity(id, 1, minDate);
		model.put("quantity", quantity);
	    model.put("minDate", minDate);
	    model.put("maxDate", maxDate);
		model.put("dessert", dessert);
		model.put("stores", stores);
		model.put("storeId", 1);
		return "/dessert/detail";
	}
	
	/**
	 * 获取某个店里的某个甜品
	 * @param id
	 * @param storeId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/d/{id}/s/{storeId}", method=RequestMethod.GET)
	public String detailWithStore(@PathVariable int id, @PathVariable int storeId, ModelMap model){
		Dessert dessert = dessertService.getDessert(id);
		List<Store> stores = storeService.getAllStore();
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");  
	    String minDate = df.format(new Date(date.getTime() + 1 * 24 * 60 * 60 * 1000));
	    String maxDate = df.format(new Date(date.getTime() + 7 * 24 * 60 * 60 * 1000));
		int quantity = dessertService.getDessertQuantity(id, storeId, minDate);
		model.put("quantity", quantity);
	    model.put("minDate", minDate);
	    model.put("maxDate", maxDate);
		model.put("dessert", dessert);
		model.put("stores", stores);
		model.put("storeId", storeId);
		return "/dessert/detail";
	}
	
	@RequestMapping(value="/getQuantityByStoreDate", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> getQuantityByStoreDate(@RequestParam int id, 
			@RequestParam int storeId, @RequestParam String date){
		Map<String, Object> map = new HashMap<String, Object>();
		int quantity = dessertService.getDessertQuantity(id, storeId, date);
		map.put("result", quantity);
		return map;
	}
	
	@Auth(Role.SALESMAN)
	@RequestMapping(value="/check")
	public @ResponseBody Map<String, Object> checkRightId(@RequestParam int id, @RequestParam int storeId){
	    Map<String, Object> map = new HashMap<String, Object>();
        Dessert dessert = dessertService.checkDessert(id, storeId);
        if(dessert != null){
            map.put("result", 1);
            map.put("dessert", dessert);
        } else {
            map.put("result", 0);
        }
        return map;
	}

}
