package com.cherryfunding.spring.service.charity;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.CDetailDao;
import com.cherryfunding.spring.dao.FDetailDao;
import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.vo.UsersVo;

@Service
public class CharityParticipantsService {

	@Autowired
	private CDetailDao cDetailDao;
 
	@Autowired
	private UsersDao usersDao;

	public List<HashMap<String, Object>> listBycNum(int cNum) {
		return cDetailDao.listBycNum(cNum);
	}

	public UsersVo usersInfo(String id) {
		return usersDao.select(id);
	}
	
}
