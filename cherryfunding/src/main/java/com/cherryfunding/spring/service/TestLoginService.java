package com.cherryfunding.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.vo.UsersVo;

@Service
public class TestLoginService {
	@Autowired
	private UsersDao dao;

	public UsersVo login(UsersVo vo) {
		return dao.login(vo);
	}

	public List<UsersVo> list() {
		return dao.list();
	}
}
