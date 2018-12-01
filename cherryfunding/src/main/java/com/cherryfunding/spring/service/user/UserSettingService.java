package com.cherryfunding.spring.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.UserSettingDao;
import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.vo.UserSettingVo;

@Service
public class UserSettingService {
	@Autowired
	private UserSettingDao userSettingDao;
	@Autowired
	private UsersDao usersDao;

	public int insert(String id) {
		return userSettingDao.insert(id);
	}

	public UserSettingVo getInfo(String id) {
		return userSettingDao.getInfo(id);
	}

	public int update(UserSettingVo vo) {
		return userSettingDao.update(vo);
	}

	public String getEmail(String id) { // 따로 뽑지 말고 vo에서 빼요
		return usersDao.getEmail(id);
	}

}
