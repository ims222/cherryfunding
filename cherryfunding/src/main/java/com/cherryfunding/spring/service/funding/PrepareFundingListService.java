package com.cherryfunding.spring.service.funding;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.FundingDao;
import com.cherryfunding.spring.vo.FundingVo;

@Service
public class PrepareFundingListService {
	@Autowired
	private FundingDao dao;
	
	public List<FundingVo> list(){
		return dao.prepare();
	}
}
