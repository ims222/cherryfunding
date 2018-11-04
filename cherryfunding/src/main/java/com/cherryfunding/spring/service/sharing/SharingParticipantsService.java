package com.cherryfunding.spring.service.sharing;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.SListDao;
import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.vo.SListVo;
import com.cherryfunding.spring.vo.UsersVo;

@Service
public class SharingParticipantsService {

	@Autowired
	private SListDao sListDao;

	@Autowired
	private UsersDao usersDao;

	public List<HashMap<String, Object>> listBysNum(int sNum) {
		return sListDao.listBysNum(sNum);
	}

	public UsersVo usersInfo(String id) {
		return usersDao.select(id);
	}
}
