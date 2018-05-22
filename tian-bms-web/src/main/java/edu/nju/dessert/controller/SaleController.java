package edu.nju.dessert.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.nju.dessert.interceptor.Auth;
import edu.nju.dessert.interceptor.Role;
import edu.nju.dessert.model.Member;
import edu.nju.dessert.model.Order;
import edu.nju.dessert.model.Payment;
import edu.nju.dessert.service.MemberService;
import edu.nju.dessert.service.OrderService;
import edu.nju.dessert.service.StaffService;
import edu.nju.dessert.service.TradeService;
import edu.nju.dessert.service.UserService;
import edu.nju.dessert.util.DiscountCalculator;
import edu.nju.dessert.vo.MemberVO;
import edu.nju.dessert.vo.OrderCreatorVO;
import edu.nju.dessert.vo.OrderVO;
import edu.nju.dessert.vo.StaffVO;

@Controller
@RequestMapping(value="/sale")
public class SaleController {

    private StaffService staffService;
    
    private MemberService memberService;
    
    private TradeService tradeService;
    
    private OrderService orderService;
    
    private UserService userService;
    
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }
    
    public void setMemberService(MemberService memberService) {
        this.memberService = memberService;
    }
    
    public void setStaffService(StaffService staffService) {
        this.staffService = staffService;
    }
    
    public void setTradeService(TradeService tradeService) {
        this.tradeService = tradeService;
    }
    
	@Auth(Role.SALESMAN)
	@RequestMapping(value="")
	public String index(HttpServletRequest req, ModelMap model){
	    String id = (String) req.getSession().getAttribute("id");
	    StaffVO staff = staffService.getStaffById(id);
	    model.put("staff", staff);
		return "/backend/sale/index";
	}
	
	@Auth(Role.SALESMAN)
	@RequestMapping(value="/sum")
	public @ResponseBody Map<String, Object> getDiscountSum(@RequestParam String mid, @RequestParam double total){
	    Map<String, Object> map = new HashMap<String, Object>();
	    Member member = memberService.getMemberByMid(mid);
	    if(member != null){
	        double sum = DiscountCalculator.calDiscount(total, member.getLevel());
	        map.put("result", 1);
	        map.put("discount", sum);
	    } else {
	        map.put("result",0);
	    }
	    return map;
	}
	
	@Auth(Role.SALESMAN)
    @RequestMapping(value="/create", method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> sale(@RequestBody OrderCreatorVO order, HttpServletRequest req){
	    String id = (String) req.getSession().getAttribute("id");
	    StaffVO staff = staffService.getStaffById(id);
        boolean result = tradeService.sale(staff.getStore_id(), order.getMid(), order.getItems());
        Map<String, Object> map = new HashMap<String, Object>();
        if(result){
            map.put("result", 1);
        }else{
            map.put("result", 0);
        }
        return map;
    }
	
	@Auth(Role.SALESMAN)
	@RequestMapping(value="/order")
	public String order(){
	   return "/backend/sale/order"; 
	}
	
	
	//@Auth(Role.SALESMAN)
	@RequestMapping(value="/getOrders")
	public @ResponseBody List<OrderVO> getOrders(HttpServletRequest req, @RequestParam int type){
	    String id = (String) req.getSession().getAttribute("id");
        StaffVO staff = staffService.getStaffById(id);
        int sid = 0;
        if(staff!=null){
            sid = staff.getStore_id();
        }
        List<OrderVO> list = orderService.getOrderVO(sid, type);
        return list;
	}
	
	@Auth(Role.SALESMAN)
	@RequestMapping(value="/orderDetail")
	public @ResponseBody Map<String, Object> getOrderDetail(HttpServletRequest req, @RequestParam int id){
	    Map<String, Object> map = new HashMap<String, Object>();
        OrderVO vo = orderService.getOrderById(id);
        if(vo != null){
            map.put("order", vo);
            map.put("result", 1);
        }else{
            map.put("result", 0);
        }
        return map;
	}
	
	@Auth(Role.SALESMAN)
	@RequestMapping(value="/member")
	public String member(){
	    return "/backend/sale/member";
	}
	
	//@Auth(Role.SALESMAN)
	@RequestMapping(value="/getMembers")
	public @ResponseBody List<MemberVO> getMembers(){
	    List<MemberVO> list = memberService.getAllMember();
	    return list;
	}
	
	//@Auth(Role.SALESMAN)
	@RequestMapping(value="/payment")
	public @ResponseBody List<Payment> getPayments(@RequestParam int id){
	    List<Payment> payments = userService.getAllPayments(id);
	    return payments;
	}
	
	//@Auth(Role.SALESMAN)
    @RequestMapping(value="/memberOrder")
    public @ResponseBody List<Order> getMemberOrders(@RequestParam int id){
        List<Order> orders = orderService.getOrderByUser(id);
        return orders;
    }
	
}
