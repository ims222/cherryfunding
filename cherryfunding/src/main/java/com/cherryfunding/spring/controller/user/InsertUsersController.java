package com.cherryfunding.spring.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping(value = "/users/idCheck")
	@ResponseBody
	public String idDuplicatedCheck(@RequestParam("id") String id) {
		JSONObject obj = new JSONObject();
		if (inputUsersService.usersInfo(id) == null) {
			obj.put("result", "ok");
		} else {
			obj.put("result", "no");
		}
		return obj.toString();
	}

	@RequestMapping(value = "/users/nickCheck")
	@ResponseBody
	public String nickCheck(@RequestParam("nick") String nick) {
		JSONObject obj = new JSONObject();
		if (inputUsersService.nickCheck(nick) == null) {
			obj.put("result", "ok");
		} else {
			obj.put("result", "no");
		}
		return obj.toString();
	}

	@RequestMapping(value = "/users/insert", method = RequestMethod.POST)
	public String inputUsers(@Valid @ModelAttribute("users") UsersVo users, BindingResult result) {
		if (result.hasErrors()) {
			return "user/userInfo/insert";
		}
		try {
			inputUsersService.inputUsers(users);
			inputUsersService.inputUserSetting(users.getId());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "redirect:/";
	}
}
