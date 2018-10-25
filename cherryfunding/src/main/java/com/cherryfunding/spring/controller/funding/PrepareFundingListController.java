package com.cherryfunding.spring.controller.funding;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	public String prepare(Model model, HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", request.getParameter("category"));
		List<FundingVo> list = prepareService.list(map);
		
		for (FundingVo vo : list) {
			vo.setSavename(prepareService.thumbnail(vo.getFnum()).getSavename());
			vo.setFpinfo(prepareService.thumbnail(vo.getFnum()).getFpinfo());
		}

		model.addAttribute("list", list);
		return ".prepareFundingList";
	}
}
