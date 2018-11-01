package com.cherryfunding.spring.service.funding;

import java.util.HashMap;
import java.util.List;

import com.cherryfunding.spring.vo.FDetailVo;
import com.cherryfunding.spring.vo.FundingVo;
import com.cherryfunding.spring.vo.RewardVo;

public interface FundingDetailService {

	public FundingVo detail(int fNum);

	public List<RewardVo> rewardList(int fNum);

	public int hitUp(int fNum);

	public RewardVo rewardDetail(int rNum);

	public int fdetailGetMaxNum();

	public int getPrice(int rNum);

	int insertFDetail(FDetailVo vo);

	int addCamout(HashMap<String, Object> map);

	int updateAmount(HashMap<String, Object> map);
	
	int getAmount(int rNum);

}