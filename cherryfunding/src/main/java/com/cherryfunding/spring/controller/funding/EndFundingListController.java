package com.cherryfunding.spring.controller.funding;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.funding.EndFundingListService;
import com.cherryfunding.spring.util.PageUtil;

@Controller
public class EndFundingListController {

	@Autowired
	private EndFundingListService endService;

	@RequestMapping(value = "/funding/endFundingList", method = RequestMethod.GET)
	public String ingFundingList() {
		return ".endFundingList";
	}

	@RequestMapping("/funding/moreEndFundingList")
	@ResponseBody
	public HashMap<String, Object> end(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model,
			HttpServletRequest request) {
		String category = request.getParameter("category");
		String field = request.getParameter("field");
		String keyword = request.getParameter("keyword");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("category", request.getParameter("category"));
		PageUtil pageUtil = new PageUtil(pageNum, endService.getTotCountEnd(map));
		map.put("startRow", pageUtil.getStartRow());
		map.put("endRow", pageUtil.getEndRow());
		
		List<HashMap<String, Object>> list = endService.list(map);
		if (list.size() == 0 && pageNum > 1) {
			map.put("list", "no");
			map.put("pageNum", pageNum);
		} else {
			map.put("list", list);
			map.put("pageNum", pageNum + 1);
		}

		return map;
	}
}
