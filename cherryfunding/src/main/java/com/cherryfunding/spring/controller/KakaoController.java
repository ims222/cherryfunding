package com.cherryfunding.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class KakaoController {

	@RequestMapping("/oauth")
	public String oauth(@RequestParam("code") String code) {
		System.out.println("!!!!!!!!!!!!!!!!!!!!");
		System.out.println(code);

		return "";
	}
}
