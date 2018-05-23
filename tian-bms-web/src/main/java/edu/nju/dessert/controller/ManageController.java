package edu.nju.dessert.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.nju.dessert.interceptor.Auth;
import edu.nju.dessert.interceptor.Role;
import edu.nju.dessert.model.Store;
import edu.nju.dessert.service.PlanService;
import edu.nju.dessert.service.StoreService;
import edu.nju.dessert.service.UserService;
import edu.nju.dessert.vo.PlanVO;

@Controller
@RequestMapping(value={"/manage"})
public class ManageController {

	@Autowired
    private PlanService planService;

	@Autowired
    private StoreService storeService;

	@Autowired
    private UserService userService;

	@Auth(Role.MANAGER)
	@RequestMapping(value="")
	public String index(HttpServletRequest req, ModelMap model){
	    List<Store> stores = storeService.getAllStore();
        List<PlanVO> plans = planService.getAllPlan();
        model.put("stores", stores);
        model.put("plans",plans);
        model.put("role", req.getSession().getAttribute("role"));
		return "backend/manage/index";
	}
	
	@Auth(Role.MANAGER)
    @RequestMapping(value="/stats")
    public String stats(HttpServletRequest req, ModelMap model){
        return "backend/manage/stats";
    }
	
	@Auth(Role.MANAGER)
    @RequestMapping(value="/stats/sale")
    public String statsSale(HttpServletRequest req, ModelMap model){
        return "backend/manage/sale";
    }
	
	@Auth(Role.MANAGER)
	@RequestMapping(value="/pass", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> passPlan(@RequestParam int id){
	    Map<String, Object> map = new HashMap<String, Object>();
	    boolean result = planService.passPlan(id);
	    if(result){
	        map.put("result", 1);
	    }else{
	        map.put("result", 0);
	    }
	    return map;
	}
	
	@Auth(Role.MANAGER)
	@RequestMapping(value="/reject", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> rejectPlan(@RequestParam int id){
	    Map<String, Object> map = new HashMap<String, Object>();
        boolean result = planService.rejectPlan(id);
        if(result){
            map.put("result", 1);
        }else{
            map.put("result", 0);
        }
        return map;
	}
	
	@Auth(Role.MANAGER)
	@RequestMapping(value="/getAges")
	public @ResponseBody List<Map<String, Object>> getAgeStat(){
	    Map<String, Long> map = userService.getAgeStat("1960");
	    Iterator<Entry<String, Long>> iter = map.entrySet().iterator();
        List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
	    while (iter.hasNext()) {
	        Entry<String,Long> entry = (Entry<String, Long>) iter.next();
	        String key = entry.getKey();
	        Long val = entry.getValue();
	        Map<String, Object> reMap = new HashMap<String, Object>();
	        reMap.put("name", key);
	        reMap.put("value", val);
	        result.add(reMap);
	    } 	    
	    return result;
	}
	
	@Auth(Role.MANAGER)
    @RequestMapping(value="/member")
    public String member(){
        return "/backend/sale/member";
    }
}
