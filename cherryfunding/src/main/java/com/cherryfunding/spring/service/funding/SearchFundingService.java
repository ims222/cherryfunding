package com.cherryfunding.spring.service.funding;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cherryfunding.spring.dao.FundingDao;
import com.cherryfunding.spring.vo.FundingVo;

@Service
public class SearchFundingService {
	@Autowired FundingDao FundingDao;
	
	public List<FundingVo> searchwaitList(HashMap<String, String> map){
		
		return FundingDao.searchwaitList(map);
		
	}
	
	public List<FundingVo> searchconfirmList(HashMap<String, String> map){
		
		return FundingDao.searchconfirmList(map);
		
	}

}
