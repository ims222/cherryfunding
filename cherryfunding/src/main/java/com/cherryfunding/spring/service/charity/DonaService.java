package com.cherryfunding.spring.service.charity;

import com.cherryfunding.spring.vo.CDetailVo;
import com.cherryfunding.spring.vo.CharityVo;
import com.cherryfunding.spring.vo.UsersVo;

public interface DonaService {

	public UsersVo userInfo(String id);

	public int donation(int donaPrice, String id);

	public int updatecDetail(CDetailVo vo);

	public int getMaxNum();

	public CDetailVo getcDetailInfo(int cdNum);

	public int updateCharity(CharityVo vo);

	public int countSupporter(int cNum);
}
