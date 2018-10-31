package com.cherryfunding.spring.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdmypageController {
	
	@RequestMapping(value="/admypage",method=RequestMethod.GET)
	public String admypage() {
		
		return "admin/manage/adminPage";
	}
	
	@RequestMapping(value="/admypagea",method=RequestMethod.GET)
	@ResponseBody
	public String admypagelist() {
		System.out.println("접근");
		
		return "";
	}

}
