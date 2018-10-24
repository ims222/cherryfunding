package com.cherryfunding.spring.controller.funding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cherryfunding.spring.service.funding.PrepareFundingListService;

@Controller
public class PrepareFundingListController {

	@Autowired
	private PrepareFundingListService prepareService;
	
	@RequestMapping("/funding/prepareFundingList")
	public String prepare(Model model) {
		model.addAttribute("list", prepareService.list());
		return "/funding/fundingBoard/prepareFundingList";
	}
}
