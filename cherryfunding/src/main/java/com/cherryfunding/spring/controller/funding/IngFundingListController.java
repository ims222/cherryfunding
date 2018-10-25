package com.cherryfunding.spring.controller.funding;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	public String ingFundingList(Model model, HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", request.getParameter("category"));
		List<FundingVo> list = ingFundingListService.list(map);

		for (FundingVo vo : list) {
			vo.setSavename(ingFundingListService.thumbnail(vo.getFnum()).getSavename());
			vo.setFpinfo(ingFundingListService.thumbnail(vo.getFnum()).getFpinfo());
		}

		model.addAttribute("list", list);
		return ".ingFundingList";
	}
}
