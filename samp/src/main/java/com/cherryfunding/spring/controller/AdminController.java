package com.cherryfunding.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cherryfunding.spring.service.Admin_service;
import com.cherryfunding.spring.vo.AdminVo;

@Controller
public class AdminController {
	
	@Autowired private Admin_service service;

	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String admin() { //관리자 layout 페이지
		return ".admin";
	}
	
	@RequestMapping(value="/alogin", method=RequestMethod.GET)
	public String adlogin() { // 관리자 로그인 페이지
		return "admin/manage/adminLogin";
	}
	
	@RequestMapping(value="/adjoin",method=RequestMethod.GET)
	public String adjoin() { // 관리자 회원가입
		return "admin/manage/adminJoin";
	}
	
	@RequestMapping(value="admin/manage/adjoin",method=RequestMethod.POST)
	
	public ModelAndView adjoin(AdminVo vo) {
		System.out.println(vo);
		int n = service.insert(vo);
		ModelAndView mv = new ModelAndView(".admin");
		
		if(n>0) {
			System.out.println("성공");
			
		}else {
			System.out.println("실패");
			
		}
		return mv;
	}
	
	@RequestMapping(value="/adlogout",method=RequestMethod.GET)
	public String adlogout() { // 관리자 로그아웃
		return "adlogout";
	}
	
	@RequestMapping(value="/admypage",method=RequestMethod.GET)
	public String admypage() {
		return "admin/manage/adminMypage";
	}

}
