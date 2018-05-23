package edu.nju.dessert.controller;

import java.util.HashMap;
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
import edu.nju.dessert.model.Member;
import edu.nju.dessert.service.MemberService;
import edu.nju.dessert.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserCenterController {

	@Autowired
	private UserService userService;

	@Autowired
	private MemberService memberService;

	@Auth(Role.SALESMAN)
	@RequestMapping(value="/getMember")
	public @ResponseBody Map<String, Object> getMember(@RequestParam String id){
	    Map<String, Object> map = new HashMap<String, Object>();
        Member member = memberService.getMemberByMid(id);
        if(member != null){
            map.put("result", 1);
            map.put("member", member);
        }else{
            map.put("result", 0);
        }
        return map;
	}

	@RequestMapping(value="/setDefaultStore", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> updateDefaultStore(HttpServletRequest req, @RequestParam("storeId") int store){
		Integer uid = (Integer) req.getSession().getAttribute("id");
		Map<String, Object> map = new HashMap<String, Object>();
		if(uid != null){
			boolean result  = userService.setDefaultStore(uid, store);
			if(result){
				map.put("result", 1);
			}else{
				map.put("result", 0);
			}
		}else{
			map.put("result", 0);
		}
		return map;
	}	
	
	
}
