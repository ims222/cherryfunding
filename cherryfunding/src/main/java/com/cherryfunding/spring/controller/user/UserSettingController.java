package com.cherryfunding.spring.controller.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryfunding.spring.service.TestLoginService;
import com.cherryfunding.spring.service.user.UserSettingService;
import com.cherryfunding.spring.vo.UserSettingVo;

@Controller
public class UserSettingController {

	@Autowired
	private UserSettingService usService;
 
	@Autowired
	private TestLoginService testLoginService;

	@RequestMapping(value = "/userSetting", method = RequestMethod.GET)
	public String userSetting(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		UserSettingVo vo = usService.getInfo(id);
		model.addAttribute("vo", vo);
		return "user/userInfo/mypage/userSetting";
	}

	@RequestMapping(value = "/updateSettings", method = RequestMethod.POST)
	public String updateSettings(HttpSession session, Model model, UserSettingVo vo) {
		String id = (String) session.getAttribute("id");
		usService.update(vo);
		UserSettingVo vo1 = usService.getInfo(id);
		model.addAttribute("vo", vo1);
		session.setAttribute("setting", testLoginService.userSetting(id));
		return "user/userInfo/mypage/userSetting";
	}
}
