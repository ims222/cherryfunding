package com.cherryfunding.spring.controller.funding;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryfunding.spring.service.funding.IngFundingListService;
import com.cherryfunding.spring.vo.FundingVo;

@Controller
public class IngFundingListController {
	@Autowired
	IngFundingListService ingFundingListService;

	@RequestMapping(value = "/funding/ingFundingList", method = RequestMethod.GET)
	public String ingFundingList(Model model) {
		List<FundingVo> list = ingFundingListService.list();

		for (FundingVo vo : list) {
			vo.setSavename(ingFundingListService.thumbnail(vo.getFnum()).getSavename());
			vo.setFpinfo(ingFundingListService.thumbnail(vo.getFnum()).getFpinfo());
		}

		model.addAttribute("list", list);
		return ".ingFundingList";
	}
}
