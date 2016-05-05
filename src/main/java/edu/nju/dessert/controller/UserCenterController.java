package edu.nju.dessert.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import edu.nju.dessert.interceptor.Auth;
import edu.nju.dessert.interceptor.Role;
import edu.nju.dessert.model.Member;
import edu.nju.dessert.model.Payment;
import edu.nju.dessert.model.Point;
import edu.nju.dessert.model.User;
import edu.nju.dessert.service.MemberService;
import edu.nju.dessert.service.OrderService;
import edu.nju.dessert.service.UserService;
import edu.nju.dessert.util.DateTranslator;
import edu.nju.dessert.vo.OrderVO;

@Controller
@RequestMapping(value="/user")
public class UserCenterController {

	private UserService userService;
	
	private MemberService memberService;
	
	private OrderService orderService;
	
	public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@Auth(Role.USER)
	@RequestMapping(value="/setting")
	public String setting(HttpServletRequest req, ModelMap model){
		int uid = (int) req.getSession().getAttribute("id");
		getBasicInfo(model, uid);
		return "/user/setting";
	}
	
	@Auth(Role.USER)
	@RequestMapping(value="/setting", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> settingForm(HttpServletRequest req, ModelMap model){
		int uid = (int) req.getSession().getAttribute("id");
		String nickname = (String) req.getParameter("nickname");
		String name = (String) req.getParameter("name");
		int sex = Integer.parseInt(req.getParameter("sex"));
		String birth = (String) req.getParameter("birth");
		String address = (String) req.getParameter("address");
		String email = (String) req.getParameter("email");
		User user = userService.getUser(uid);
		user.setNickname(nickname);
		user.setName(name);
		user.setSex(sex);
		user.setBirth(DateTranslator.strToDate(birth));
		user.setAddress(address);
		user.setEmail(email);
		boolean result = userService.updateUser(user);
		Map<String, Object> map = new HashMap<String, Object>();
		if(result){
			map.put("result", 1);
		}else{
			map.put("result", 0);
		}
		return map;
	}
	
	@Auth(Role.USER)
	@RequestMapping(value="/modifypassword", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> modifypassword(HttpServletRequest req, ModelMap model){
		int uid = (int) req.getSession().getAttribute("id");
		String password = (String) req.getParameter("password");
		String newpwd = (String) req.getParameter("newpwd");
		int result = userService.updatePassword(uid, password, newpwd);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return map;
	}
	
	@Auth(Role.USER)
	@RequestMapping(value="/uploadAvatar", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> uploadAvatar(@RequestParam("avatar") CommonsMultipartFile file, HttpServletRequest req, ModelMap model){
		int uid = (int) req.getSession().getAttribute("id");
		Map<String, Object> map = new HashMap<String, Object>();
		if(!file.isEmpty()){
		    ServletContext sc = req.getSession().getServletContext();
		    String path = sc.getRealPath("/upload");
		    String filename = file.getOriginalFilename();
		    String ext = filename.substring(filename.lastIndexOf("."));
		    filename = uid + ext;
			File targetFile = new File(path, filename);
			try {
				FileUtils.writeByteArrayToFile(targetFile, file.getBytes());
			    String url = req.getContextPath() + "/upload/";
				boolean result = userService.updateAvatar(uid, url+filename);
				if(result){
					map.put("result", 1);
					map.put("url", url+filename);
				} else {
					map.put("result", 0);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			map.put("result", 0);
		}
		return map;
	}
	
	@Auth(Role.USER)
	@RequestMapping(value={"/vip",""})
	public String vip(HttpServletRequest req, ModelMap model){
		int uid = (int) req.getSession().getAttribute("id");
		getBasicInfo(model, uid);
		return "/user/vip";
	}
	
	@Auth(Role.USER)
	@RequestMapping(value="/charge", method=RequestMethod.GET)
	public String charge(HttpServletRequest req, ModelMap model){
		int uid = (int) req.getSession().getAttribute("id");
		getBasicInfo(model, uid);
		return "/user/charge";
	}
	
	@Auth(Role.USER)
	@RequestMapping(value="/charge", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> chargeForm(HttpServletRequest req, HttpServletResponse response){
		int uid = (int) req.getSession().getAttribute("id");
		String password = req.getParameter("password");
		int value = Integer.parseInt(req.getParameter("value"));
		boolean result = memberService.charge(uid, password, value);
		Map<String, Object> map = new HashMap<String, Object>();
		if(result){
			memberService.updateLevel(uid);
			map.put("result", 1);
		}else {
			map.put("result", 0);
		}

		Member member = memberService.getMember(uid);
		map.put("balance", member.getBalance());
		map.put("level", member.getLevel());
		map.put("state", member.getState());
		map.put("validity", member.getValidity());
		return map;
	}
	
	@Auth(Role.USER)
	@RequestMapping(value={"/activate","recover"}, method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> activate(HttpServletRequest req, HttpServletResponse response){
		int uid = (int) req.getSession().getAttribute("id");
		String password = req.getParameter("password");
		int value = Integer.parseInt(req.getParameter("value"));
		boolean result = memberService.activate(uid, password, value);
		Map<String, Object> map = new HashMap<String, Object>();
		if(result){
			memberService.updateLevel(uid);
			map.put("result", 1);
		}else {
			map.put("result", 0);
		}

		Member member = memberService.getMember(uid);
		map.put("balance", member.getBalance());
		map.put("level", member.getLevel());
		map.put("state", member.getState());
		map.put("validity", member.getValidity());
		return map;
	}
	
	
	@Auth(Role.USER)
	@RequestMapping(value="/orders")
	public String order(HttpServletRequest req, ModelMap model){
		int uid = (int) req.getSession().getAttribute("id");
		getBasicInfo(model, uid);
		List<OrderVO> list = orderService.getOrderVOByUser(uid, 0);
		System.out.println(list.size());
		model.put("orders", list);
		model.put("page", 0);
		return "/user/orders";
	}
	
	@Auth(Role.USER)
	@RequestMapping(value="/points")
	public String point(HttpServletRequest req, ModelMap model){
		int uid = (int) req.getSession().getAttribute("id");
		getBasicInfo(model, uid);
		return "/user/points";
	}
	
	@Auth(Role.USER)
	@RequestMapping(value="/exchange", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> exchange(HttpServletRequest req, @RequestParam int point){
		Map<String, Object> map = new HashMap<String, Object>();
		int uid = (int) req.getSession().getAttribute("id");
		boolean result = memberService.exchangePoint(uid, point);
		if(result){
			Member member = memberService.getMember(uid);
			List<Point> pointlist = userService.getPoints(uid, 1);
			map.put("result", 1);
			map.put("point", member.getPoint());
			map.put("balance", member.getBalance());
			map.put("pointlist", pointlist);
			map.put("page", 0);
		}else{
			map.put("result", 0);
		}
		return map;
	}
	
	@Auth(Role.USER)
	@RequestMapping(value="/payments", method=RequestMethod.GET)
	public String payment(HttpServletRequest req, ModelMap model){
		int uid = (int) req.getSession().getAttribute("id");
		getBasicInfo(model, uid);
		List<Payment> payments = userService.getPayments(uid, 0);
		model.put("payments", payments);
		model.put("current", 1);
		model.put("max", userService.getTotalPaymentPages(uid));
		return "/user/payments";
	}
	
	@Auth(Role.USER)
	@RequestMapping(value="/payments/{page}", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> getPayment(@PathVariable int page, HttpServletRequest req, ModelMap model){
		Map<String, Object> map = new HashMap<String, Object>();
		int uid = (int) req.getSession().getAttribute("id");
		List<Payment> payments = userService.getPayments(uid, page-1);
		if(payments.size()>0){
			map.put("result", 1);
		}else{
			map.put("result", 0);
		}
		map.put("payments", payments);
		return map;
	}
	
	@Auth(Role.USER)
	@RequestMapping(value="/points", method=RequestMethod.GET)
	public String points(HttpServletRequest req, ModelMap model){
		int uid = (int) req.getSession().getAttribute("id");
		getBasicInfo(model, uid);
		List<Point> points = userService.getPoints(uid,0);
		model.put("points", points);
		model.put("current", 1);
		model.put("max", userService.getTotalPointPages(uid));
		return "/user/points";
	}
	
	@Auth(Role.USER)
	@RequestMapping(value="/points/{page}", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> getPoint(@PathVariable int page, HttpServletRequest req, ModelMap model){
		Map<String, Object> map = new HashMap<String, Object>();
		int uid = (int) req.getSession().getAttribute("id");
		List<Point> points = userService.getPoints(uid, page-1);
		if(points.size()>0){
			map.put("result", 1);
		}else{
			map.put("result", 0);
		}
		map.put("points", points);
		return map;
	}
	
	
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
		
	@Auth(Role.USER)
	@RequestMapping(value="/cancel")
	public @ResponseBody Map<String, Object> cancel(HttpServletRequest req){
	    int uid = (int) req.getSession().getAttribute("id");
	    boolean result = userService.cancel(uid);
	    Map<String, Object> map = new HashMap<String, Object>();
	    if(result){
            map.put("result", 1);
        }else{
            map.put("result", 0);
        }
	    return map;
	}
	
	
	private void getBasicInfo(ModelMap model, int uid){
		User user = userService.getUser(uid);
		model.put("user", user);
		Member member = memberService.getMember(uid);
		model.put("member", member);
	}
	
}
