package com.cherryfunding.spring.controller.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SessionController {
	 @RequestMapping(value = "/security/login", method = RequestMethod.GET)
	    public String loginGet() {
	        return "statics/login";
	    } 
	 @RequestMapping(value = "/security/login", method = RequestMethod.POST)
	    public String loginPost(HttpServletRequest request,HttpSession session) { 	
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			session.setAttribute("id", id);
			return "redirect:/";
	}
	 @RequestMapping(value="/security/logout")
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/";
		}
}
