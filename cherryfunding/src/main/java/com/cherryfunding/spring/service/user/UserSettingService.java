package com.cherryfunding.spring.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.UserSettingDao;
import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.vo.UserSettingVo;

@Service
public class UserSettingService {
	@Autowired
	private UserSettingDao dao;
	@Autowired
	private UsersDao dao1;
	
	public int insert(String id) {
		return dao.insert(id);
	}
	
	public UserSettingVo getInfo(String id) {
		return dao.getInfo(id);
	}
	
	public int update(UserSettingVo vo) {
		return dao.update(vo);
	}
	
	public String getEmail(String id) {
		return dao1.getEmail(id);
	}
	
	
}
