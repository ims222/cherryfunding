package com.cherryfunding.spring.controller.funding;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cherryfunding.spring.service.funding.EndFundingListService;
import com.cherryfunding.spring.vo.FundingVo;

@Controller
public class EndFundingListController {

	@Autowired
	private EndFundingListService endService;

	@RequestMapping("/funding/endFundingList")
	public String end(Model model) {
		List<FundingVo> list = endService.list();

		for (FundingVo vo : list) {
			vo.setSavename(endService.thumbnail(vo.getFnum()).getSavename());
			vo.setFpinfo(endService.thumbnail(vo.getFnum()).getFpinfo());
		}

		model.addAttribute("list", list);
		return "/funding/fundingBoard/endFundingList";
	}
}
