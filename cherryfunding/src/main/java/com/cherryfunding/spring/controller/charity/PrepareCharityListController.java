package com.cherryfunding.spring.controller.charity;

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

import com.cherryfunding.spring.service.charity.PrepareCharityListService;
import com.cherryfunding.spring.util.PageUtil;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.vo.CharityVo;
import com.cherryfunding.spring.vo.FundingVo;

@Controller
public class PrepareCharityListController {


	@Autowired
	private PrepareCharityListService prepareService;

	@RequestMapping(value = "/charity/prepareCharityList", method = RequestMethod.GET)
	public String ingFundingList() {
		return ".prepareCharityList";
	}

	@RequestMapping("/charity/morePrepareCharityList")
	@ResponseBody
	public HashMap<String, Object> ingFundingList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			Model model, HttpServletRequest request) {
		String category = request.getParameter("category");
		String keyword = request.getParameter("keyword");
		String sort = request.getParameter("sort");

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("keyword", keyword);
		map.put("sort", sort);
		PageUtil pageUtil = new PageUtil(pageNum, prepareService.getTotCountPrepare(map));

		map.put("startRow", pageUtil.getStartRow());
		map.put("endRow", pageUtil.getEndRow());

		List<HashMap<String, Object>> list = prepareService.list(map);
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
