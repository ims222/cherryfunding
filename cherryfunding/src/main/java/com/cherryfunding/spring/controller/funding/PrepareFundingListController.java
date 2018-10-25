package com.cherryfunding.spring.controller.funding;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cherryfunding.spring.service.funding.PrepareFundingListService;
import com.cherryfunding.spring.vo.FundingVo;

@Controller
public class PrepareFundingListController {

	@Autowired
	private PrepareFundingListService prepareService;

	@RequestMapping("/funding/prepareFundingList")
	public String prepare(Model model) {
		List<FundingVo> list = prepareService.list();

		for (FundingVo vo : list) {
			System.out.println(prepareService.thumbnail(vo.getFnum()));
			vo.setSavename(prepareService.thumbnail(vo.getFnum()));
		}
		for (FundingVo vo : list) {
			System.out.println(vo.getSavename());
		}

		model.addAttribute("list", list);
		return "/funding/fundingBoard/prepareFundingList2";
	}
}
