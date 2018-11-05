package com.cherryfunding.spring.service.user;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.vo.UsersVo;

@Service
public class DepositUsersService {

	@Autowired
	private UsersDao usersDao;

	public int deposit(HashMap<String, Object> map) {
		return usersDao.deposit(map);
	}

	public UsersVo userInfo(String id) {
		return usersDao.detail(id);
	}
}
