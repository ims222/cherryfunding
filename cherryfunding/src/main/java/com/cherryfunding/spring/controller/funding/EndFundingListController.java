package com.cherryfunding.spring.controller.funding;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cherryfunding.spring.service.funding.EndFundingListService;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.vo.FundingVo;

@Controller
public class EndFundingListController {

	@Autowired
	private S3Util s3;

	@Autowired
	private EndFundingListService endService;

	@RequestMapping("/funding/endFundingList")
	public String end(Model model, HttpServletRequest request) {
		String category = request.getParameter("category");
		String field = request.getParameter("field");
		String keyword = request.getParameter("keyword");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("category", request.getParameter("category"));
		List<FundingVo> list = endService.list(map);

		for (FundingVo vo : list) {
			String thumbnail = endService.thumbnail(vo.getFnum()).getSavename();
			vo.setSavename(s3.getFileURL("funding/" + thumbnail));
			vo.setFpinfo(endService.thumbnail(vo.getFnum()).getFpinfo());
		}

		model.addAttribute("list", list);
		model.addAttribute("category", category);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		return ".endFundingList";
	}
}
