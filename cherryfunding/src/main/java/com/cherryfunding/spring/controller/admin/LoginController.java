package com.cherryfunding.spring.controller.admin;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryfunding.spring.service.admin.Ad_Service;
import com.cherryfunding.spring.vo.AdminVo;

@Controller
public class LoginController {
	
	@Autowired private Ad_Service service;
	
	@RequestMapping(value="/adlogin",method=RequestMethod.GET)
	public String adlogin() {
		return "admin/manage/adminLogin";
	}
	
	@RequestMapping(value="/adlogin",method=RequestMethod.POST)
	
	public String adlogin1(HttpServletRequest request) {
		
		String aid=request.getParameter("aid");
		String pwd = request.getParameter("pwd");
		System.out.println(aid+pwd);
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("aid", aid);
		map.put("pwd",pwd);
		AdminVo vo = service.login(map);
		
		if(vo!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("aid", aid);
			return ".admin";
		}else {
			request.setAttribute("errMsg", "아이디 또는 비밀번호가 맞지 않아요");
			return "admin/manage/adminLogin";
		}
	}
	
	@RequestMapping("adlogout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/admin";
	}

}
