package com.cherryfunding.spring.controller.charity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.funding.FundingUpdateService;
import com.cherryfunding.spring.vo.FundingVo;

@Controller
public class CharityUpdateController {

	@Autowired
	private FundingUpdateService fundingUpdateService;

	@RequestMapping("/funding/editContent")
	@ResponseBody
	public FundingVo editContent(FundingVo vo) {
		fundingUpdateService.update(vo);
		return fundingUpdateService.detail(vo.getfNum());
	}
}
