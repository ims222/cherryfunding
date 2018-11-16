package com.cherryfunding.spring.service.funding;

import java.util.HashMap;
import java.util.List;

import com.cherryfunding.spring.vo.FDetailVo;
import com.cherryfunding.spring.vo.FHashtagVo;
import com.cherryfunding.spring.vo.FResultVo;
import com.cherryfunding.spring.vo.FundingVo;
import com.cherryfunding.spring.vo.RewardVo;
import com.cherryfunding.spring.vo.UsersVo;

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

	int countFdetailbyfNum(int fNum);

	UsersVo userInfo(String id);

	int fResultGetMaxNum();

	int insertFResult(FResultVo vo);

	int withdraw(HashMap<String, Object> map);
}