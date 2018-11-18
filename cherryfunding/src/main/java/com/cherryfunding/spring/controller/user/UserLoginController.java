package com.cherryfunding.spring.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryfunding.spring.DuplicateLoginPrevent.DuplicateLoginPrevent;
import com.cherryfunding.spring.service.TestLoginService;
import com.cherryfunding.spring.vo.UsersVo;

@Controller
public class UserLoginController extends DuplicateLoginPrevent {

	@Autowired
	private TestLoginService testLoginService;

	// for Testing
	@RequestMapping(value = "/testlogin", method = RequestMethod.GET)
	public String loginForm() {
		return "cicadas_login";
	}

	@RequestMapping(value = "/testlogout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/testlogin", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpSession session) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		UsersVo vo = new UsersVo();
		vo.setId(id);
		vo.setPwd(pwd);
		if (super.isUsing(vo.getId(), session)) {
			System.out.println("중복로그인되었습니다");
			super.removeLoginInfo(session, vo.getId());
		}
		if (testLoginService.login(vo) != null) {
			session.setAttribute("id", vo.getId());
			session.setAttribute("login", vo);
			session.setAttribute("setting", testLoginService.userSetting(id));
		}
		return "redirect:/";
	}
}
