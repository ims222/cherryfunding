package com.cherryfunding.spring.controller.user;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryfunding.spring.service.user.InputUsersService;
import com.cherryfunding.spring.vo.UsersVo;

@Controller
public class InsertUsersController {

	@Autowired
	private InputUsersService inputUsersService;

	@RequestMapping(value = "/users/insert", method = RequestMethod.GET)
	public String inputUsersForm() {
		return "user/userInfo/insert";
	}

	@RequestMapping(value = "/users/insert", method = RequestMethod.POST)
	public String inputUsers(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String nick = request.getParameter("nick");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String birth = request.getParameter("birth");

		try {
			java.util.Date ubirth = new SimpleDateFormat("yyyy-MM-dd").parse(birth);

			UsersVo uvo = new UsersVo();
			uvo.setId(id);
			uvo.setPwd(pwd);
			uvo.setNick(nick);
			uvo.setEmail(email);
			uvo.setAddr(addr);
			uvo.setGender(gender);
			uvo.setPhone(phone);
			uvo.setBirth(new Date(ubirth.getTime()));

			inputUsersService.inputUsers(uvo);
			inputUsersService.inputUserSetting(id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "redirect:/";
	}
}
