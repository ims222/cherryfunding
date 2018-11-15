package com.cherryfunding.spring.service.funding;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cherryfunding.spring.dao.FDetailDao;
import com.cherryfunding.spring.dao.FHashtagDao;
import com.cherryfunding.spring.dao.FRecommendDao;
import com.cherryfunding.spring.dao.FundingDao;
import com.cherryfunding.spring.dao.RewardDao;
import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.vo.FDetailVo;
import com.cherryfunding.spring.vo.FHashtagVo;
import com.cherryfunding.spring.vo.FundingVo;
import com.cherryfunding.spring.vo.RewardVo;
import com.cherryfunding.spring.vo.UsersVo;

@Transactional
@Service
public class FundingDetailServiceImpl implements FundingDetailService {

	@Autowired
	private FundingDao fundingDao;

	@Autowired
	private RewardDao rewardDao;

	@Autowired
	private FDetailDao fDetailDao;

	@Autowired
	private FRecommendDao fRecommendDao;

	@Autowired
	private FHashtagDao fHashtagDao;

	@Autowired
	private UsersDao usersDao;

	@Override
	public FundingVo detail(int fNum) {
		return fundingDao.select(fNum);
	}

	@Override
	public List<RewardVo> rewardList(int fNum) {
		return rewardDao.rewardItem(fNum);
	}

	@Override
	public int hitUp(int fNum) {
		return fundingDao.hitUp(fNum);
	}

	@Override
	public RewardVo rewardDetail(int rNum) {
		return rewardDao.detail(rNum);
	}

	@Override
	public int fdetailGetMaxNum() {
		return fDetailDao.getMaxNum();
	}

	@Override
	public int getPrice(int rNum) {
		return rewardDao.getPrice(rNum);
	}

	@Override
	public int insertFDetail(FDetailVo fDetailVo) {
		fDetailVo.setFdNum(this.fdetailGetMaxNum() + 1);
		return fDetailDao.insert(fDetailVo);
	}

	@Override
	public int addCamout(HashMap<String, Object> map) {
		return fundingDao.addCamout(map);
	}

	@Override
	public int updateAmount(HashMap<String, Object> map) {
		return rewardDao.updateAmount(map);
	}

	@Override
	public int getAmount(int rNum) {
		return rewardDao.getAmount(rNum);
	}

	@Override
	public int getRecommend(int fNum) {
		return fRecommendDao.getRecommend(fNum);
	}

	@Override
	public List<FHashtagVo> hashtag(int fNum) {
		return fHashtagDao.listByfNum(fNum);
	}

	@Override
	public int countFdetailbyfNum(int fNum) {
		return fDetailDao.countFdetailbyfNum(fNum);
	}

	@Override
	public UsersVo userInfo(String id) {
		return usersDao.select(id);
	}

}
