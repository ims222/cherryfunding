package com.cherryfunding.spring.controller.user;

import java.util.HashMap;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.user.DepositUsersService;

@Controller
public class DepositUsersController {

	@Autowired
	private DepositUsersService depositUsersService;

	@RequestMapping("/users/usersDeposit")
	@ResponseBody
	public String usersDeposit(String id, int deposit) {
		JSONObject obj = new JSONObject();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("deposit", deposit);
		depositUsersService.deposit(map);
		obj.put("deposit", depositUsersService.userInfo(id).getBalance());
		return obj.toString();
	}
}
