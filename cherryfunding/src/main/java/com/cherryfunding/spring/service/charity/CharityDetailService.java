package com.cherryfunding.spring.service.charity;

import java.util.HashMap;
import java.util.List;

import com.cherryfunding.spring.vo.CHashtagVo;
import com.cherryfunding.spring.vo.CharityVo;
import com.cherryfunding.spring.vo.UsersVo;

public interface CharityDetailService {
	CharityVo detail(int cNum);

	int hitUp(int cNum);

	int addCamount(CharityVo vo);

	int updateAmount(CharityVo vo);

	int getRecommend(int cNum);

	List<CHashtagVo> hashtag(int cNum);

	UsersVo userInfo(String id);

	int withdraw(HashMap<String, Object> map);
}
