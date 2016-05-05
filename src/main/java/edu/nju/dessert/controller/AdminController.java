package edu.nju.dessert.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.nju.dessert.interceptor.Auth;
import edu.nju.dessert.interceptor.Role;
import edu.nju.dessert.model.Store;
import edu.nju.dessert.service.StaffService;
import edu.nju.dessert.service.StoreService;
import edu.nju.dessert.vo.StaffVO;


@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	private StaffService staffService;
	
	private StoreService storeService;
	
	public void setStoreService(StoreService storeService) {
		this.storeService = storeService;
	}
	
	public void setStaffService(StaffService staffService){
		this.staffService = staffService;
	}

	@Auth(Role.ADMIN)
	@RequestMapping(value="")
	public String showStore(HttpServletRequest req, ModelMap model){
		List<Store> stores = storeService.getAllStore();
		model.put("stores", stores);
		return "/backend/admin/index";
	}
	
	@Auth(Role.ADMIN)
	@RequestMapping(value="/modifyStore", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> modifyStore(HttpServletRequest req){
		int sid = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");
		String desc = req.getParameter("desc");
		int result = storeService.update(sid, name, tel, address, desc);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return map;
	}
	
	@Auth(Role.ADMIN)
	@RequestMapping(value="/deleteStore", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteStore(HttpServletRequest req){
		int sid = Integer.parseInt(req.getParameter("id"));
		int result = storeService.deleteStore(sid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return map;
	}
	
	@Auth(Role.ADMIN)
	@RequestMapping(value="/addStore",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> addStore(HttpServletRequest req){
		Map<String, Object> map = new HashMap<String, Object>();
		String name = req.getParameter("name");
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");
		String desc = req.getParameter("desc");
		int sid = storeService.addStore(name, tel, address,desc);
		if(sid != 0){
			map.put("result", 1);
//			if(!file.isEmpty()){
//			    ServletContext sc = req.getSession().getServletContext();
//			    String path = sc.getRealPath("/upload/store");
//			    String filename = file.getOriginalFilename();
//			    String ext = filename.substring(filename.lastIndexOf("."));
//			    filename = sid + ext;
//				File targetFile = new File(path, filename);
//				try {
//					FileUtils.writeByteArrayToFile(targetFile, file.getBytes());
//					map.put("result", 1);
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//			}
		} else {
			map.put("result", 0);
		}
		return map;
	}
	
	@Auth(Role.ADMIN)
	@RequestMapping(value="/staff")
	public String staff(HttpServletRequest req, ModelMap model){
		List<StaffVO> staffs = staffService.getAllEmployee();
		List<Store> stores = storeService.getAllStore();
		model.put("staffs", staffs);
		model.put("stores", stores);
		return "/backend/admin/staff";
	}

	@Auth(Role.ADMIN)
	@RequestMapping(value="/modifyStaff", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> modifyStaff(HttpServletRequest req){
		String sid = req.getParameter("id");
		String name = req.getParameter("name");
		String tel = req.getParameter("tel");
		String password = req.getParameter("password");
		int store_id = Integer.parseInt(req.getParameter("store_id"));
		int position = Integer.parseInt(req.getParameter("position"));
		boolean result = staffService.updateStaff(sid, name, tel, password, store_id, position);
		Map<String, Object> map = new HashMap<String, Object>();
		if(result){
			map.put("result", 1);
		}else{
			map.put("result", 0);
		}
		return map;
	}
	
	@Auth(Role.ADMIN)
	@RequestMapping(value="/deleteStaff", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteStaff(HttpServletRequest req){
		String id = req.getParameter("id");
		System.out.println(id);
		boolean result = staffService.deleteStaff(id);
		Map<String, Object> map = new HashMap<String, Object>();
		if(result){
			map.put("result", 1);
		}else{
			map.put("result", 0);
		}
		return map;
	}
	
	@Auth(Role.ADMIN)
	@RequestMapping(value="/addStaff",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> addStaff(HttpServletRequest req){
		Map<String, Object> map = new HashMap<String, Object>();
		String name = req.getParameter("name");
		String tel = req.getParameter("tel");
		String password = req.getParameter("password");
		int store_id = Integer.parseInt(req.getParameter("store_id"));
		int position = Integer.parseInt(req.getParameter("position"));
		String sid = staffService.addStaff(name, tel, password, store_id, position);
		System.out.println("addStaff: "+sid);
		if(sid != null){
			map.put("result",1);
			map.put("id", sid);
		}else{
			map.put("result", 0);
		}
		return map;
	}
	
}
