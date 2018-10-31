package com.cherryfunding.spring.controller.funding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cherryfunding.spring.service.funding.FundingDetailService;

@Controller
public class FundingDetailController {

	@Autowired
	private FundingDetailService fundingDetailService;

	@RequestMapping("/funding/fundingDetailforUser")
	public String fundingDetail(int fNum, Model model) {
		model.addAttribute("vo", fundingDetailService.detail(fNum));
		model.addAttribute("rewardList", fundingDetailService.rewardList(fNum));
		fundingDetailService.hitUp(fNum);
		return ".fundingDetailforUser";
	}
}
