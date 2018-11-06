package com.cherryfunding.spring.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cherryfunding.spring.dao.UserSettingDao;
import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.vo.UsersVo;

@Transactional
@Service
public class InputUsersServiceImpl implements InputUsersService {

	@Autowired
	private UsersDao usersDao;

	@Autowired
	private UserSettingDao userSettingDao;

	@Override
	public int inputUsers(UsersVo vo) {
		return usersDao.insert(vo);
	}

	@Override
	public int inputUserSetting(String id) {
		return userSettingDao.insert(id);
	}

	@Override
	public UsersVo usersInfo(String id) {
		return usersDao.select(id);
	}

	@Override
	public UsersVo nickCheck(String nick) {
		return usersDao.nickCheck(nick);
	}

}
