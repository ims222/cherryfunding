package com.cherryfunding.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cherryfunding.spring.util.KakaoLogin;
import com.fasterxml.jackson.databind.JsonNode;

@Controller
public class KakaoController {

	@RequestMapping(value = "/oauth", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST })
	public String oauth(@RequestParam("code") String code, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		JsonNode token = KakaoLogin.getAccessToken(code);

		JsonNode profile = KakaoLogin.getKakaoUserInfo(token.path("access_token").toString());
		System.out.println(profile);
//		UserVO vo = KakaoLogin.changeData(profile);
//		vo.setUser_snsId("k" + vo.getUser_snsId());

		System.out.println(session);
//		session.setAttribute("login", vo);
//		System.out.println(vo.toString());

//		vo = service.kakaoLogin(vo);

		return ".main";
	}
}
