package edu.nju.dessert.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.nju.dessert.interceptor.Auth;
import edu.nju.dessert.interceptor.Role;
import edu.nju.dessert.model.Dessert;
import edu.nju.dessert.model.Store;
import edu.nju.dessert.service.DessertService;
import edu.nju.dessert.service.PlanService;
import edu.nju.dessert.service.StoreService;
import edu.nju.dessert.util.DateTranslator;
import edu.nju.dessert.vo.PlanCreatorVO;
import edu.nju.dessert.vo.PlanItemVO;
import edu.nju.dessert.vo.PlanUpdatorVO;
import edu.nju.dessert.vo.PlanVO;

@Controller
@RequestMapping(value="/plan")
public class PlanController {

	@Autowired
	private StoreService storeService;

	@Autowired
	private PlanService planService;

	@Autowired
	private DessertService dessertService;

	@Auth(Role.HEAD_SALESMAN)
	@RequestMapping(value="")
	public String index(ModelMap model){
		List<Store> stores = storeService.getAllStore();
		List<PlanVO> plans = planService.getAllPlan();
		model.put("stores", stores);
		model.put("plans",plans);
		return "/backend/plan/index";
	}
	
	@Auth(Role.HEAD_SALESMAN)
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String create(ModelMap model){
		List<Store> stores = storeService.getAllStore();
		List<Dessert> desserts = dessertService.getDessertList(0, 80);
		Date date = planService.getLatestDate(1);
		if(date==null)
            date = new Date();
		String minDateStr = DateTranslator.dateToStr(new Date(date.getTime() + 1 * 24 * 60 * 60 * 1000));
		model.put("stores", stores);
		model.put("desserts",desserts);
		model.put("minDate", minDateStr);
		return "/backend/plan/create";
	}
	
	@Auth(Role.HEAD_SALESMAN)
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> createPlan(@RequestBody List<PlanCreatorVO> planList, ModelMap model){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean result = planService.addPlans(planList);
		if(result){
			map.put("result", 1);
		} else {
			map.put("result", 0);
		}
		return map;
	}
	
	@Auth(Role.HEAD_SALESMAN)
	@RequestMapping(value="/getLatestPlanDate")
	public @ResponseBody Map<String, Object> getLatestPlanDate(@RequestParam int sid){
		Map<String, Object> map = new HashMap<String, Object>();
		Date date = planService.getLatestDate(sid);
		if(date==null)
			date = new Date();
		String dateStr = DateTranslator.dateToStr(date);
		map.put("date", dateStr);
		return map;
	}
	
	@Auth(Role.HEAD_SALESMAN)
	@RequestMapping(value="/getPlanByStore")
	public @ResponseBody List<PlanVO> getPlanByStore(@RequestParam(required = false) Integer sid){
		Map<String, Object> map = new HashMap<String, Object>();
		List<PlanVO> plans = null;
		if(sid == null){
			plans = planService.getAllPlan();
		}else{
			plans = planService.getPlanByStore(sid);
		}
		map.put("result",plans);
		return plans;
	}
	
	@Auth(Role.HEAD_SALESMAN)
	@RequestMapping(value="/view/{pid}")
	public String viewPlan(@PathVariable int pid, HttpServletRequest req, ModelMap model){
	    PlanVO planVO = planService.getPlanById(pid);
	    List<PlanItemVO> items = planService.getPlanItemByPlanId(pid);
	    Long total = planService.getTotalNum();
	    if(pid > 1){
	        model.put("pre", pid-1);
	    }
	    if(pid < total){
	        model.put("next", pid+1);
	    }
	    model.put("plan", planVO);
    	model.put("items", items);
    	model.put("role", req.getSession().getAttribute("role"));
	    return "/backend/plan/plan_detail";
	}
	
	@Auth(Role.HEAD_SALESMAN)
    @RequestMapping(value="/modify/{pid}")
    public String modifyPlan(@PathVariable int pid, ModelMap model){
        PlanVO planVO = planService.getPlanById(pid);
        List<PlanItemVO> items = planService.getPlanItemByPlanId(pid);
        model.put("plan", planVO);
        model.put("items", items);
        if(planVO.getState() == 2){
            return "/backend/plan/plan_modify";
        } else {
            return "/backend/plan/plan_detail";
        }
    }
	
	@Auth(Role.HEAD_SALESMAN)
    @RequestMapping(value="/modify", method=RequestMethod.POST)
    public @ResponseBody Map<String, Object>  modifyPlanSubmit(@RequestBody PlanUpdatorVO plan, ModelMap model){
	    Map<String, Object> map = new HashMap<String, Object>();
	    boolean result = planService.updatePlan(plan);
	    if(result){
	        map.put("result", 1);
	    }else{
	        map.put("result", 0);
	    }
	    return map;
    }
	
}
