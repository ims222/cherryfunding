package com.cherryfunding.spring.service.funding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.FundingDao;
import com.cherryfunding.spring.vo.FundingVo;

@Service
public class FundingUpdateService {

	@Autowired
	private FundingDao fundingDao;

	public int update(FundingVo vo) {
		return fundingDao.update(vo);
	}

	public FundingVo detail(int fNum) {
		return fundingDao.detail(fNum);
	}
}
