package edu.nju.dessert.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.nju.dessert.interceptor.Auth;
import edu.nju.dessert.interceptor.Role;
import edu.nju.dessert.model.Address;
import edu.nju.dessert.service.AddressService;

@Controller
@RequestMapping(value="/address")
public class AddressController {

	@Autowired
	private AddressService addressService;

	@Auth(Role.USER)
	@RequestMapping(value="/get", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> getAddress(HttpServletRequest req, @RequestParam("aid") int aid) {
		Map<String, Object> map = new HashMap<>();
		Address address = addressService.getAddress(aid);
		map.put("address", address);
		return map;
	}
	
	
	@Auth(Role.USER)
	@RequestMapping(value="/getAll", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> getAllAddresses(HttpServletRequest req) {
		int uid = (int) req.getSession().getAttribute("id");
		Map<String, Object> map = new HashMap<>();
		Address defaultAddress = addressService.getDefaultAddress(uid);
		List<Address> addrlist = addressService.getAddressesExceptDefault(uid);
		map.put("defaultAddress", defaultAddress);
		map.put("addrList", addrlist);
		return map;
	}
	
	@Auth(Role.USER)
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> addAddress(HttpServletRequest req, @RequestParam("receiver") String receiver,
			@RequestParam("address") String address, @RequestParam("tel") String tel, @RequestParam("setDefault") int def) {
		int uid = (int) req.getSession().getAttribute("id");
		int aid = this.addressService.addAddress(uid, address, tel, receiver);
		if(def == 1){
			this.addressService.setDefaultAddress(uid, aid);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("result", aid);
		return map;
	}

	@Auth(Role.USER)
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> editAddress(HttpServletRequest req, @RequestParam("aid") int aid,
		@RequestParam("receiver") String receiver, @RequestParam("address") String address,
	    @RequestParam("tel") String tel) {
		boolean result = this.addressService.updateAddress(aid, address, tel, receiver);
		Map<String, Object> map = new HashMap<>();
		map.put("result", result);
		return map;
	}

	@Auth(Role.USER)
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteAddress(HttpServletRequest req, @RequestParam("aid") int aid) {
		int uid = (int) req.getSession().getAttribute("id");
		boolean result = this.addressService.deleteAddress(uid, aid);
		Map<String, Object> map = new HashMap<>();
		map.put("result", result); // result为false表示不允许删除默认地址
		return map;
	}

	@Auth(Role.USER)
	@RequestMapping(value="/setDefault", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> setDefaultAddress(HttpServletRequest req, @RequestParam("aid") int aid) {
		int uid = (int) req.getSession().getAttribute("id");
		boolean result = this.addressService.setDefaultAddress(uid, aid);
		Map<String, Object> map = new HashMap<>();
		map.put("result", result);
		return map;
	}

}
