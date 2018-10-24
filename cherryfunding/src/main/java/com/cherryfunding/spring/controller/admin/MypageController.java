package com.cherryfunding.spring.controller.admin;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class MypageController {
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public String admypage() {
		
		return "admypage";
	}

}
