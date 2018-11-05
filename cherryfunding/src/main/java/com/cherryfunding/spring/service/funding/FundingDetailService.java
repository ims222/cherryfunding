package com.cherryfunding.spring.service.funding;

import java.util.HashMap;
import java.util.List;

import com.cherryfunding.spring.vo.FDetailVo;
import com.cherryfunding.spring.vo.FHashtagVo;
import com.cherryfunding.spring.vo.FundingVo;
import com.cherryfunding.spring.vo.RewardVo;

public interface FundingDetailService {

	FundingVo detail(int fNum);

	List<RewardVo> rewardList(int fNum);

	int hitUp(int fNum);

	RewardVo rewardDetail(int rNum);

	int fdetailGetMaxNum();

	int getPrice(int rNum);

	int insertFDetail(FDetailVo vo);

	int addCamout(HashMap<String, Object> map);

	int updateAmount(HashMap<String, Object> map);

	int getAmount(int rNum);

	int getRecommend(int fNum);

	List<FHashtagVo> hashtag(int fNum);
}