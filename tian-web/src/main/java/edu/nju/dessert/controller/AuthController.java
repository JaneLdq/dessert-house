package edu.nju.dessert.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.nju.dessert.interceptor.Auth;
import edu.nju.dessert.interceptor.Role;
import edu.nju.dessert.model.Staff;
import edu.nju.dessert.model.User;
import edu.nju.dessert.service.AuthService;
import edu.nju.dessert.service.MemberService;
import edu.nju.dessert.service.UserService;

@Controller
@RequestMapping(value="/auth")
public class AuthController {

	@Autowired
	private AuthService authService;

	@Autowired
	private UserService userService;

	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="")
	public String index(HttpServletRequest request, @RequestParam(required=false) String backurl, ModelMap model){
		request.getSession().removeAttribute("id");
		request.getSession().removeAttribute("hasLogin");
		if(backurl != null)
			request.getSession().setAttribute("backURL", backurl);
		String msg = (String) request.getAttribute("msg");
		if(msg != null){
			model.put("msg", msg);
		}
		return "login";
	}

	@RequestMapping(value="/reg", method=RequestMethod.GET)
	public String indexReg(){
		return "register";
	}
	
	@RequestMapping(value="/regform", method=RequestMethod.POST)
	public String register(HttpServletRequest req, HttpServletResponse response, ModelMap model){
		String tel = req.getParameter("tel");
		String password = req.getParameter("password");
		String nickname = req.getParameter("nickname");
		String name = req.getParameter("name");
		String sex = req.getParameter("sex");
		String birth = req.getParameter("birth");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");                
		Date birthDay = null;
		try {
			birthDay = sdf.parse(birth);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		User user = new User();
		user.setTel(tel);
		user.setName(name);
		user.setNickname(nickname);
		user.setSex(Integer.parseInt(sex));
		user.setBirth(birthDay);
		user.setPassword(password);
		int result = authService.register(user);
		if(result == 1){
			int loginId = authService.login(tel, password);
			if(loginId != -1){
				HttpSession session = (HttpSession) req.getSession();
				session.setAttribute("hasLogin", true);
				session.setAttribute("id", loginId);
				session.setAttribute("isUser", true);
				model.put("nickname", nickname);
				return "member";
			}
			return "login";
		}else{
			model.put("result", -1);
			return "register";
		}
	}
	
	@Auth(Role.USER)
	@RequestMapping(value="/regmember", method=RequestMethod.POST)
	public void regMember(HttpServletRequest req, HttpServletResponse response) throws IOException{
		int id = (int) req.getSession().getAttribute("id");
		String address = req.getParameter("address");
		String name = req.getParameter("name");
		userService.updateUserInfo(id, name, address);
		String bankcard = req.getParameter("bankcard");
		String paypassword = req.getParameter("paypassword");
		memberService.addMember(id, bankcard, paypassword);
		response.sendRedirect(req.getContextPath() + "/user");
	}

	@RequestMapping(value="/user")
	public void login(HttpServletRequest request, HttpServletResponse response, String id, String password) throws ServletException, IOException{
		int loginId = authService.login(id, password);
		if( loginId != -1){
			HttpSession session = (HttpSession) request.getSession();
			session.setAttribute("hasLogin", true);
			session.setAttribute("isUser", true);
			session.setAttribute("id", loginId);
			String url = (String)session.getAttribute("backURL");
			if(url != null){
				 response.sendRedirect(url);
			} else {
				response.sendRedirect(request.getContextPath()+ "/index");
			}
		}else{
			request.setAttribute("msg", "用户名或密码错误!");
			request.getRequestDispatcher("/auth").forward(request, response);
		}
	}
	
	@RequestMapping(value="/check", method=RequestMethod.GET)
	public void checkLogin(HttpServletRequest request, HttpServletResponse response){
		Boolean login = (Boolean) request.getSession().getAttribute("isUser");
		try {
			if(login != null){
				response.getWriter().write("1");
			}else{
				response.getWriter().write("0");
			}
		} catch (IOException e) {
		      e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/logout")
	public void logout(HttpServletRequest req, HttpServletResponse response){
		req.getSession().removeAttribute("hasLogin");
		req.getSession().removeAttribute("id");
		req.getSession().removeAttribute("isUser");
		req.getSession().removeAttribute("isAdmin");
		req.getSession().removeAttribute("backURL");
		try {
			response.sendRedirect(req.getContextPath() + "/index");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
