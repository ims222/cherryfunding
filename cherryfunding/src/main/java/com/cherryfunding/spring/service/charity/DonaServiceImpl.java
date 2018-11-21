package com.cherryfunding.spring.service.charity;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cherryfunding.spring.dao.CDetailDao;
import com.cherryfunding.spring.dao.CharityDao;
import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.vo.CDetailVo;
import com.cherryfunding.spring.vo.CharityVo;
import com.cherryfunding.spring.vo.UsersVo;

@Transactional
@Service
public class DonaServiceImpl implements DonaService {

	@Autowired
	private CharityDao charityDao;
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
		return cDetailDao.insert(vo);
	}

	@Override
	public int getMaxNum() {
		return cDetailDao.getMaxNum();
	}

	@Override
	public CDetailVo getcDetailInfo(int cdNum) {
		return cDetailDao.select(cdNum);
	}

	@Override
	public int updateCharity(CharityVo vo) {
		return charityDao.update(vo);
	}

	@Override
	public int countSupporter(int cNum) {
		return cDetailDao.countCdetailbycNum(cNum);
	}

}
