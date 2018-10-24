package com.cherryfunding.spring.controller.funding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cherryfunding.spring.service.funding.EndFundingListService;

@Controller
public class EndFundingListController {

	@Autowired
	private EndFundingListService endService;

	@RequestMapping("/funding/endFundingList")
	public String end(Model model) {
		model.addAttribute("list", endService.list());
		return "/funding/fundingBoard/endFundingList";
	}
}
