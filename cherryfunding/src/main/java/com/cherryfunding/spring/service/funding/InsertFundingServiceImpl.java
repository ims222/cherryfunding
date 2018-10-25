package com.cherryfunding.spring.service.funding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.FHashtagDao;
import com.cherryfunding.spring.dao.FPictureDao;
import com.cherryfunding.spring.dao.FundingDao;
import com.cherryfunding.spring.dao.RewardDao;
import com.cherryfunding.spring.vo.FHashtagVo;
import com.cherryfunding.spring.vo.FPictureVo;
import com.cherryfunding.spring.vo.FundingVo;
import com.cherryfunding.spring.vo.RewardVo;

@Service
public class InsertFundingServiceImpl implements InsertFundingService{
	@Autowired
	private FHashtagDao fHashtagDao;

	@Autowired
	private RewardDao rewardDao;

	@Autowired
	private FundingDao fundingDao;

	@Autowired
	private FPictureDao fPictureDao;

	@Override
	public int finsert(FundingVo fvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int fhinsert(FHashtagVo fhvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int rinsert(RewardVo rvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int fpinsert(FPictureVo fpvo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
