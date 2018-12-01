package com.cherryfunding.spring.service.funding;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.FDetailDao;
import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.vo.UsersVo;

@Service
public class FundingParticipantsService {

	@Autowired
	private FDetailDao fDetailDao; 

	@Autowired
	private UsersDao usersDao;

	public List<HashMap<String, Object>> listByfNum(int fNum) {
		return fDetailDao.listByfNum(fNum);
	}

	public UsersVo usersInfo(String id) {
		return usersDao.select(id);
	}
}
