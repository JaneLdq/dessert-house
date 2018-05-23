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

	@RequestMapping(value="/internal", method=RequestMethod.GET)
	public String indexInternal() throws ServletException, IOException{
		return "/backend/login_internal";
	}

	
	@RequestMapping(value="/internal", method=RequestMethod.POST)
	public void loginInternal(HttpServletRequest request, HttpServletResponse response, Model model,
			String id, String password) throws ServletException, IOException{
		Staff staff = authService.loginStaff(id, password);
		if(staff != null){
			HttpSession session = (HttpSession) request.getSession();
			session.setAttribute("hasLogin", true);
			session.setAttribute("id", staff.getSid());
			session.setAttribute("role", staff.getPosition());
			switch (staff.getPosition()) {
			case 0:
				response.sendRedirect(request.getContextPath() + "/admin");
				break;
			case 1:
				response.sendRedirect(request.getContextPath() + "/manage");
				break;
			case 2:
				response.sendRedirect(request.getContextPath() + "/plan");
				break;
			case 3:
				response.sendRedirect(request.getContextPath() + "/sale");
				break;
			default:
				break;
			}
		} else {
			model.addAttribute("msg", "用户名或密码错误");
			response.sendRedirect(request.getContextPath() + "/auth/internal");
		}
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
			response.sendRedirect(req.getContextPath() + "/");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
