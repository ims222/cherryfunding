package com.cherryfunding.spring.controller.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryfunding.spring.service.user.MypageService;
import com.cherryfunding.spring.vo.MypageVo;

@Controller
public class UserSettingController {
	
	@Autowired
	private MypageService mpService;
	
	@RequestMapping(value = "/userSetting", method = RequestMethod.GET)
	public String mypage(HttpSession session,Model model) {
		String id=(String)session.getAttribute("id");
		return "user/userInfo/mypage/userSetting";
	}
}
