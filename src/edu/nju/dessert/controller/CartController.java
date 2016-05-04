package edu.nju.dessert.controller;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.nju.dessert.interceptor.Auth;
import edu.nju.dessert.interceptor.Role;
import edu.nju.dessert.service.DessertService;
import edu.nju.dessert.service.TradeService;
import edu.nju.dessert.util.DateTranslator;
import edu.nju.dessert.vo.CartItemVO;

@Controller
@RequestMapping(value="/cart")
public class CartController {
	
	private TradeService tradeService;
	
	private DessertService dessertService;
	
	public void setDessertService(DessertService dessertService) {
		this.dessertService = dessertService;
	}
	
	public void setTradeService(TradeService tradeService) {
		this.tradeService = tradeService;
	}
	
	@Auth(Role.USER)
	@RequestMapping(value="")
	public String index(HttpServletRequest req, ModelMap model){
		int uid = (int) req.getSession().getAttribute("id");
		List<CartItemVO> items = tradeService.getCartItem(uid); 
		model.put("len", items.size());
		model.put("items", items);
		Date date = new Date(); 
	    String minDate = DateTranslator.dateToStr(new Date(date.getTime() + 1 * 24 * 60 * 60 * 1000));
	    String maxDate = DateTranslator.dateToStr(new Date(date.getTime() + 7 * 24 * 60 * 60 * 1000));
	    model.put("minDate", minDate);
	    model.put("maxDate", maxDate);
		return "/trade/cart";
	}
	
	@Auth(Role.USER)
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> addToCart(HttpServletRequest req, @RequestParam int dessertId, @RequestParam int quantity,
			@RequestParam int storeId, @ RequestParam String dateStr){
		HttpSession session = req.getSession();
		int uid = (int)session.getAttribute("id");
		Date date = DateTranslator.strToDate(dateStr);
		boolean result = tradeService.addCartItem(uid, dessertId, quantity, storeId, date);
		Map<String, Object> map = new HashMap<String, Object>();  
		map.put("result", result);
		return map;
	}
	
	
	@Auth(Role.USER)
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> updateCart(HttpServletRequest req, @RequestParam int id, 
			@RequestParam int dessertId, @RequestParam int quantity,
			@RequestParam int storeId, @ RequestParam String dateStr){             
		Date date = DateTranslator.strToDate(dateStr);
		Integer uid = (Integer)req.getSession().getAttribute("id");
		Double total = tradeService.updateCartItem(id, uid, dessertId, quantity, storeId, date);
		int remain = dessertService.getDessertQuantity(dessertId, storeId, dateStr);
		Map<String, Object> map = new HashMap<String, Object>();  
		if(total == null){
			map.put("result", 0);
		}else{
			map.put("result", 1);
			map.put("total", new DecimalFormat("#.0").format(total));	
			map.put("remain", remain);
		}
		return map;
	}
	
	@Auth(Role.USER)
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> removeFromCart(@RequestParam int id, @RequestParam int quantity){        
		double total = tradeService.removeCartItem(id, quantity);
		Map<String, Object> map = new HashMap<String, Object>();  
		map.put("total", new DecimalFormat("#.0").format(total));
		return map;
	}
	
	@Auth(Role.USER)
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteFromCart(@RequestParam int id){
		boolean result = tradeService.deleteCartItem(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return map;
	}
	
	@Auth(Role.USER)
	@RequestMapping(value="/total", method=RequestMethod.POST)
	public @ResponseBody long getCartItemTotal(HttpServletRequest req){
		HttpSession session = req.getSession();
		Integer uid = (Integer)session.getAttribute("id");
		Long total = tradeService.getCartTotalQuantity(uid);
		if(total==null)
			return 0;
		return total;
	}
	
	@Auth(Role.USER)
	@RequestMapping(value="/sum", method=RequestMethod.POST)
	public @ResponseBody Map<String, String> getCartTotal(HttpServletRequest req){
		HttpSession session = req.getSession();
		int uid = (int)session.getAttribute("id");
		Map<String, String> map = tradeService.getCartSum(uid);
		return map;
	}
	
	@Auth(Role.USER)
	@RequestMapping(value="/book", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> book(HttpServletRequest req, HttpServletResponse response){
		int id = (int) req.getSession().getAttribute("id");
		Map<String, Object> map = new HashMap<String, Object>();
		int result = tradeService.book(id);
		map.put("result", result);
		return map;
	}
	
	
}