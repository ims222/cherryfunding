package com.cherryfunding.spring.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.MypageDao;
import com.cherryfunding.spring.dao.UserSettingDao;
import com.cherryfunding.spring.vo.MypageVo;
import com.cherryfunding.spring.vo.UserSettingVo;
import com.cherryfunding.spring.vo.UsersVo;

@Service
public class MypageService {
	@Autowired
	private MypageDao dao;

	@Autowired
	private UserSettingDao userSettingDao;

	public int charitySum(String id) {
		return dao.charitySum(id);
	}

	public int fundingSum(String id) {
		return dao.fundingSum(id);
	}

	public List<MypageVo> charityList(String id) {
		return dao.charityList(id);
	}

	public List<MypageVo> fundingList(String id) {
		return dao.fundingList(id);
	}

	public int nowBalance(String id) {
		return dao.nowBalance(id);
	}

	public UsersVo getInfo(String id) {
		return dao.getInfo(id);
	}

	public int updateUsers(UsersVo vo) {
		return dao.updateUsers(vo);
	}

	public UserSettingVo getUserSetting(String id) {
		return userSettingDao.getInfo(id);
	}

	public UsersVo getInfoByNick(String nick) {
		return dao.getInfoByNick(nick);
	}
}
