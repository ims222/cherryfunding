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

import com.cherryfunding.spring.service.funding.IngFundingListService;
import com.cherryfunding.spring.util.PageUtil;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.vo.FundingVo;

@Controller
public class IngFundingListController {

	@Autowired
	private S3Util s3; // 이미지 저장

	@Autowired
	IngFundingListService ingFundingListService;

	@RequestMapping(value = "/funding/ingFundingList", method = RequestMethod.GET)
	public String ingFundingList() {
		return ".ingFundingList";
	}

	@RequestMapping("/funding/moreIngFundingList")
	@ResponseBody
	public HashMap<String, Object> ingFundingList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model,
			HttpServletRequest request) {
		String category = request.getParameter("category");
		String field = request.getParameter("field");
		String keyword = request.getParameter("keyword");
		String sort = request.getParameter("sort");
		PageUtil pageUtil = new PageUtil(pageNum, ingFundingListService.getTotCount());
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", pageUtil.getStartRow());
		map.put("endRow", pageUtil.getEndRow());
		map.put("category", category);
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("sort", sort);
		List<FundingVo> list = ingFundingListService.list(map);
		
//		Date date = ...; // wherever you get this from
//		 
//		DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
//		String text = df.format(date);
		 
//		System.out.println("The date is: " + text);
		
		map.put("list", list);
		map.put("pageNum", pageNum + 1);
		return map;
	}

	@RequestMapping(value = "/funding/searchHashtag")
	public String searchHashtag(String hashtag, Model model) {
		List<FundingVo> searchHashtag = ingFundingListService.searchHashtag(hashtag);
		model.addAttribute("list", searchHashtag);
		return ".ingFundingList";
	}
}
