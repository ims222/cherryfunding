package com.cherryfunding.spring.batch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cherryfunding.spring.service.funding.FundingService;
import com.cherryfunding.spring.vo.FundingVo;

@Controller
public class FundingSoldOutController { // 마감 표시

	@Autowired 
	private FundingService fundingService;

	public void fundingSoldOut() {
		List<FundingVo> ingList = fundingService.ingAll();
		
		
	}
}
