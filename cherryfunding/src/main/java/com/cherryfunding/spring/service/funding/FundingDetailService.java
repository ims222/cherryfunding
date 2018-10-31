package com.cherryfunding.spring.service.funding;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.FDetailDao;
import com.cherryfunding.spring.dao.FundingDao;
import com.cherryfunding.spring.dao.RewardDao;
import com.cherryfunding.spring.vo.FDetailVo;
import com.cherryfunding.spring.vo.FundingVo;
import com.cherryfunding.spring.vo.RewardVo;

@Service
public class FundingDetailService {

	@Autowired
	private FundingDao fundingDao;

	@Autowired
	private RewardDao rewardDao;

	@Autowired
	FDetailDao fDetailDao;

	public FundingVo detail(int fNum) {
		return fundingDao.select(fNum);
	}

	public List<RewardVo> rewardList(int fNum) {
		return rewardDao.rewardItem(fNum);
	}

	public int hitUp(int fNum) {
		return fundingDao.hitUp(fNum);
	}

	public RewardVo rewardDetail(int rNum) {
		return rewardDao.detail(rNum);
	}

	public int insertFDetail(FDetailVo vo) {
		return fDetailDao.insert(vo);
	}

	public int getMaxNum() {
		return fDetailDao.getMaxNum();
	}
}
