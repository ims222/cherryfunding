package com.cherryfunding.spring.controller.admin;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amazonaws.util.json.JSONObject;
import com.cherryfunding.spring.service.admin.Ad_Service;
import com.cherryfunding.spring.vo.AdminVo;

@Controller
public class LoginController {
	
	@Autowired private Ad_Service service;
	
	@RequestMapping(value="/adlogin",method=RequestMethod.GET)
	public String adlogin() {
		return "admin/manage/adminLogin";
	}
	
	@ResponseBody
	@RequestMapping(value="/adlogin1",method=RequestMethod.GET)
	public HashMap<String, String> adlogin1(HttpServletRequest request) {
		String aid=request.getParameter("aid");
		String pwd = request.getParameter("pwd");
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("aid", aid);
		map.put("pwd",pwd);
		AdminVo vo = service.login(map);
		HashMap<String, String> map1 = new HashMap<String, String>();
		if(vo!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("aid", aid);
			map1.put("msg", "session");
		}else {
			map1.put("msg", "1111");
			
		}
		return map1;
		
		
	}
	
	@RequestMapping(value="/adlogin",method=RequestMethod.POST)
	public String adlogin(HttpServletRequest request) {
		
		String aid=request.getParameter("aid");
		String pwd = request.getParameter("pwd");
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("aid", aid);
		map.put("pwd",pwd);
		AdminVo vo = service.login(map);
		
		if(vo!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("adid", aid);
			return ".admin";
		}else {
			request.setAttribute("msg", "아이디와 비밀번호가 맞지 않습니다.");
			return ".admin";
			
		}
		
	}
	
	@RequestMapping("adlogout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/admin";
	}

}
