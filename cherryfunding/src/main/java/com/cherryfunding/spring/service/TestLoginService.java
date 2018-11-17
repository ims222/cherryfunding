package com.cherryfunding.spring.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.UserSettingDao;
import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.vo.UserSettingVo;
import com.cherryfunding.spring.vo.UsersVo;

@Service
public class TestLoginService {
	@Autowired
	private UsersDao dao;

	@Autowired
	private UserSettingDao userSettingDao;

	public UsersVo login(UsersVo vo) {
		return dao.login(vo);
	}

	public List<UsersVo> list() {
		return dao.list();
	}

	public int insert(UsersVo vo) {
		return dao.insert(vo);
	}

	public UsersVo detail(String id) {
		return dao.select(id);
	}

	public int update(UsersVo vo) {
		return dao.update(vo);
	}

	public int delete(HashMap<String, String> map) {
		return dao.delete(map);
	}

	public UsersVo userlogin(HashMap<String, String> map) {
		return dao.userlogin(map);
	}

	public UserSettingVo userSetting(String id) {
		return userSettingDao.getInfo(id);
	}
}
