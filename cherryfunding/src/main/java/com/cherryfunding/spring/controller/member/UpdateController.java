package com.cherryfunding.spring.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.cherryfunding.spring.service.TestLoginService;
import com.cherryfunding.spring.vo.UsersVo;


@Controller
@SessionAttributes("vo")
public class UpdateController {
	@Autowired
	private TestLoginService service;
	 
	@ModelAttribute("vo")
	public UsersVo user(String id) {
		UsersVo vo = service.detail(id);
		return vo;
	}
	
	@RequestMapping("/mypage")
	public String mypage(String id) {
		return "mypage";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String update() {
		return "update";
	}
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateOk(UsersVo vo , SessionStatus ss) {
		service.update(vo);
		ss.setComplete();
		return "redirect:/";
	}
	
}
