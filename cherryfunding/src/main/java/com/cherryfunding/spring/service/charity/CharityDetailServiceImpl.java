package com.cherryfunding.spring.service.charity;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cherryfunding.spring.dao.CDetailDao;
import com.cherryfunding.spring.dao.CHashtagDao;
import com.cherryfunding.spring.dao.CRecommendDao;
import com.cherryfunding.spring.dao.CharityDao;
import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.vo.CHashtagVo;
import com.cherryfunding.spring.vo.CharityVo;
import com.cherryfunding.spring.vo.UsersVo;

@Transactional
@Service
public class CharityDetailServiceImpl implements CharityDetailService {

	@Autowired
	private CharityDao charityDao;

	@Autowired
	private CHashtagDao cHashtagDao;

	@Autowired
	private CRecommendDao cRecommendDao;

	@Autowired
	private CDetailDao cDetailDao;

	@Override
	public CharityVo detail(int cNum) {
		return charityDao.select(cNum);
	}

	@Override
	public int hitUp(int cNum) {
		return charityDao.hitUp(cNum);
	}

	@Override
	public int addCamount(CharityVo vo) {
		return charityDao.update(vo);
	}

	@Override
	public int updateAmount(CharityVo vo) {
		return charityDao.update(vo);
	}

	@Override
	public int getRecommend(int cNum) {
		return cRecommendDao.getRecommend(cNum);
	}

	@Override
	public List<CHashtagVo> hashtag(int cNum) {
		return cHashtagDao.listBycNum(cNum);
	}

	@Override
	public UsersVo userInfo(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int withdraw(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int countCdetailbycNum(int cNum) {
		return cDetailDao.countCdetailbycNum(cNum);
	}

}
