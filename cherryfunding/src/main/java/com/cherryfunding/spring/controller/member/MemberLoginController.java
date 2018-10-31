package com.cherryfunding.spring.controller.member;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryfunding.spring.service.TestLoginService;
import com.cherryfunding.spring.vo.UsersVo;

@Controller
public class MemberLoginController {
@Autowired
private TestLoginService service;

	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(HttpServletRequest req, HttpSession session) {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		UsersVo vo = service.userlogin(map);
		if (vo!=null) {
			session = req.getSession();
			session.setAttribute("id", id);
			return "redirect:/";
		} else {
			session.setAttribute("errMsg", "아이디나 비번이 맞지 않습니다.");
			return "login";
		}
		
	}
}
