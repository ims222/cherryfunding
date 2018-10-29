package com.cherryfunding.spring.service.funding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.RewardDao;
import com.cherryfunding.spring.vo.RewardVo;

@Service
public class RewardService {
	@Autowired
	private RewardDao rewardDao;

	public int insert(RewardVo vo) {
		return rewardDao.insert(vo);
	}

	public int getMaxNum() {
		return rewardDao.getMaxNum();
	}
}
