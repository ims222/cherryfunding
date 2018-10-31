package com.cherryfunding.spring.controller.funding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cherryfunding.spring.service.funding.FundingConfirmService;

@Controller
public class FundingConfirmController {

	@Autowired
	private FundingConfirmService fundingConfirmService;

	@RequestMapping("/funding/waitList")
	public String waitList(Model model) {
		model.addAttribute("waitList", fundingConfirmService.waitList());
		model.addAttribute("fundingList", fundingConfirmService.list());
		return "confirm";
	}

	@RequestMapping("/funding/confirm")
	public String confirm(int fNum) {
		fundingConfirmService.confirm(fNum);
		return "redirect:/funding/waitList";
	}

}
