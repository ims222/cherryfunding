package com.cherryfunding.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainTest {

	@RequestMapping("/mainTest")
	public String mainTest() {
		return "mainTest";
	}
}
