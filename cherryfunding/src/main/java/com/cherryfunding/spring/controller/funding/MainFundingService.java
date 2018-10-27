package com.cherryfunding.spring.controller.funding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.FundingDao;
import com.cherryfunding.spring.vo.FundingVo;

@Service
public class MainFundingService {

	@Autowired
	private FundingDao fdao;
	
	public FundingVo mainEnd() {
		return fdao.mainEnd();
	}
	public FundingVo mainNew() {
		return fdao.mainNew();
	}
	public FundingVo mainHot() {
		return fdao.mainHot();
	}
	public FundingVo mainPrice() {
		return fdao.mainPrice();
	}
	
}