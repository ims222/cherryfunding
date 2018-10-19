package com.samp.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return ".main";
	}
	
	@RequestMapping(value="/hhh")
	public String hh() {
		return "main/home";
	}
	
}
