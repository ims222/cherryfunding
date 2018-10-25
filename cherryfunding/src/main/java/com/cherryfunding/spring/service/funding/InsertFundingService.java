package com.cherryfunding.spring.service.funding;

import com.cherryfunding.spring.vo.FHashtagVo;
import com.cherryfunding.spring.vo.FPictureVo;
import com.cherryfunding.spring.vo.FundingVo;
import com.cherryfunding.spring.vo.RewardVo;

public interface InsertFundingService {
	int finsert(FundingVo fvo); //펀딩
	int fhinsert(FHashtagVo fhvo);//해시태크
	int rinsert(RewardVo rvo);//펀딩테이블
	int fpinsert(FPictureVo fpvo);//펀딩테이블
}
