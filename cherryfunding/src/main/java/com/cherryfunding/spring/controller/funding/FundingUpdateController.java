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

	@RequestMapping("/funding/editContent")
	@ResponseBody
	public FundingVo editContent(FundingVo vo) {
		fundingUpdateService.update(vo);
		System.out.println("!!!!!!!!!!!!!!");
		System.out.println(vo.toString());
		return fundingUpdateService.detail(vo.getfNum());
	}
}
