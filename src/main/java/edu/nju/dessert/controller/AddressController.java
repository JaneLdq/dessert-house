package edu.nju.dessert.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.nju.dessert.interceptor.Auth;
import edu.nju.dessert.interceptor.Role;
import edu.nju.dessert.service.AddressService;

@Controller
@RequestMapping(value="/address")
public class AddressController {

	private AddressService addressService;
	
	public void setAddressService(AddressService addressService){
		this.addressService = addressService;
	}
	
	@Auth(Role.USER)
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> addAddress(HttpServletRequest req, @RequestParam("receiver") String receiver,
			@RequestParam("address") String address, @RequestParam("tel") String tel){
		int uid = (int) req.getSession().getAttribute("id");
		int result = this.addressService.addAddress(uid, address, tel, receiver);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return map;
	}
}
