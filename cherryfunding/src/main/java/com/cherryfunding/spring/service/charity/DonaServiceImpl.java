package com.cherryfunding.spring.service.charity;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cherryfunding.spring.dao.CDetailDao;
import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.vo.CDetailVo;
import com.cherryfunding.spring.vo.UsersVo;

@Transactional
@Service
public class DonaServiceImpl implements DonaService {

	@Autowired
	private UsersDao usersDao;

	@Autowired
	private CDetailDao cDetailDao;

	@Override
	public UsersVo userInfo(String id) {
		return usersDao.select(id);
	}

	@Override
	public int donation(int donaPrice, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("price", donaPrice);
		return usersDao.withdraw(map);
	}

	@Override
	public int updatecDetail(CDetailVo vo) {
		vo.setCdNum(cDetailDao.getMaxNum() + 1);

		return cDetailDao.insert(vo);
	}
}
