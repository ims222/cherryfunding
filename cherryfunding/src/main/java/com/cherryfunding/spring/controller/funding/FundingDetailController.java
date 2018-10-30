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
	public String fundingDetail(int fnum, Model model) {
		System.out.println("detail: " + fundingDetailService.detail(fnum));
		model.addAttribute("vo", fundingDetailService.detail(fnum));
		model.addAttribute("reward", fundingDetailService.rewardList(fnum));
		return ".fundingDetailforUser";
	}
}
