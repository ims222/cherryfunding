package com.cherryfunding.spring.controller.funding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.funding.FundingUpdateService;
import com.cherryfunding.spring.vo.FundingVo;

@Controller
public class FundingUpdateController {

	@Autowired
	private FundingUpdateService fundingUpdateService;

	@RequestMapping("/charity/editContent")
	@ResponseBody
	public FundingVo editContent(FundingVo vo) {
		fundingUpdateService.update(vo);
		return fundingUpdateService.detail(vo.getfNum());
	}
}
