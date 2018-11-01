package com.cherryfunding.spring.service.funding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cherryfunding.spring.dao.FHashtagDao;
import com.cherryfunding.spring.dao.FPictureDao;
import com.cherryfunding.spring.dao.FundingDao;
import com.cherryfunding.spring.dao.RewardDao;
import com.cherryfunding.spring.vo.FHashtagVo;
import com.cherryfunding.spring.vo.FPictureVo;
import com.cherryfunding.spring.vo.FundingVo;
import com.cherryfunding.spring.vo.RewardVo;

@Transactional
@Service
public class InsertFundingServiceImpl implements InsertFundingService {
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
		return fundingDao.insert(fvo);
	}

	@Override
	public int fhinsert(FHashtagVo fhvo) {
		return fHashtagDao.insert(fhvo);
	}

	@Override
	public int rinsert(RewardVo rvo) {
		return rewardDao.insert(rvo);
	}

	@Override
	public int fpinsert(FPictureVo fpvo) {
		return fPictureDao.insert(fpvo);
	}

}
