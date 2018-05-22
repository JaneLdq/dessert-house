package edu.nju.dessert.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	@Override    
    public boolean preHandle(HttpServletRequest request,    
            HttpServletResponse response, Object handler) throws Exception {
		if(handler.getClass().isAssignableFrom(HandlerMethod.class)){
			Auth auth = ((HandlerMethod)handler).getMethodAnnotation(Auth.class);
			if( auth == null || auth.value() == Role.ALL){
				return true;
			} else {
				HttpSession session = request.getSession();
				if(request.getMethod().equals("GET")){
					String url = "/Tian" + request.getServletPath().toString();
					String params = "";
					if(request.getQueryString()!=null){
						params += "?" + request.getQueryString();
					}
					session.setAttribute("backURL", url + params);
				}
				// 角色判断
				Integer role = (Integer) session.getAttribute("role");
				if(role==null){
					role = -1;
				}
				switch (auth.value()) {
				case USER:
					if(session.getAttribute("isUser") != null){
						return true;
					}else{
						request.getRequestDispatcher("/auth").forward(request, response); 
						return false;
					}
				case ADMIN:
					if(role == 0 ){
						return true;
					}else{
						request.getRequestDispatcher("/auth/internal").forward(request, response); 
						return false;
					}
				case MANAGER:
					if( role == 1 ){
						return true;
					}else{
						request.getRequestDispatcher("/auth/internal").forward(request, response); 
						return false;
					}
				case HEAD_SALESMAN:
					if(role == 2 || role == 1 ){
						return true;
					}else{
						request.getRequestDispatcher("/auth/internal").forward(request, response); 
						return false;
					}
				case SALESMAN:
					if(role == 3 ){
						return true;
					}else{
						request.getRequestDispatcher("/auth/internal").forward(request, response); 
						return false;
					}					
				default:
					break;
				}
			}
		}
		return true;
	}

}
