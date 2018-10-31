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
public class WithdrawalController {
	@Autowired
	private TestLoginService service;
	
	@RequestMapping(value="/withdrawal",method=RequestMethod.GET)
	public String withdrawal() {
		return "withdrawal";
	}
	
	
	@RequestMapping(value="/withdrawal",method=RequestMethod.POST)
	public String withdrawal(HttpServletRequest req,HttpSession session) {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		//String reason = req.getParameter("reason");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		//map.put("reason", reason);
		int n = service.delete(map);
		if (n>0) {
			
			req.setAttribute("msg","탈퇴가 완료되었습니다. 감사합니다" );
			session.invalidate();
			return "redirect:/";
		} else {
			req.setAttribute("msg", "아이디나 비번이 맞지 않습니다. 다시 입력해주세요");
			return "withdrawal";
		}
		
	}
}
