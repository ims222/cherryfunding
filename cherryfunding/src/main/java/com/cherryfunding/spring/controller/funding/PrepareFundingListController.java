package com.cherryfunding.spring.controller.funding;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
			vo.setSavename(prepareService.thumbnail(vo.getFnum()).getSavename());
			vo.setFpinfo(prepareService.thumbnail(vo.getFnum()).getFpinfo());
		}

		model.addAttribute("list", list);
		return ".prepareFundingList";
	}
}
