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
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.vo.FundingVo;

@Controller
public class IngFundingListController {
	@Autowired
	private S3Util s3;
	@Autowired
	IngFundingListService ingFundingListService;

	@RequestMapping(value = "/funding/ingFundingList", method = RequestMethod.GET)
	public String ingFundingList(Model model, HttpServletRequest request) {
		String category = request.getParameter("category");
		String field = request.getParameter("field");
		String keyword = request.getParameter("keyword");
		String sort = request.getParameter("sort");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("sort", sort);
		List<FundingVo> list = ingFundingListService.list(map);

		model.addAttribute("list", list);
		model.addAttribute("category", category);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		model.addAttribute("sort", sort);
		return ".ingFundingList";
	}

	@RequestMapping(value = "/funding/searchHashtag")
	public String searchHashtag(String hashtag, Model model) {
		List<FundingVo> searchHashtag = ingFundingListService.searchHashtag(hashtag);
		model.addAttribute("list", searchHashtag);
		return ".ingFundingList";
	}
}
