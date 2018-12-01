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
	IngFundingListService ingFundingListService;

	@RequestMapping(value = "/funding/ingFundingList", method = RequestMethod.GET)
	public String ingFundingList() {
		return ".ingFundingList";
	}

	@RequestMapping("/funding/moreIngFundingList")
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
		PageUtil pageUtil = new PageUtil(pageNum, ingFundingListService.getTotCount(map));

		map.put("startRow", pageUtil.getStartRow());
		map.put("endRow", pageUtil.getEndRow());

		List<HashMap<String, Object>> list = ingFundingListService.list(map);
		if (list.size() == 0 && pageNum > 1) {
			map.put("list", "no");
			map.put("pageNum", pageNum);
		} else {
			map.put("list", list);
			map.put("pageNum", pageNum + 1);
		}
		
		return map;
	}

	@RequestMapping(value = "/funding/relatedWords", method = RequestMethod.GET)
	@ResponseBody
	public List<String> ingFundingMist(Model model, HttpServletRequest request) {
		String keyword = request.getParameter("keyword");
		String field = request.getParameter("field");
		// 한글로 넘어온 필드를 원 컬럼명으로 변경
		if (field.equals("제목")) {
			field = "title";
		} else if (field.equals("내용")) {
			field = "content";
		} else {
			field = "id";
		}
		// 해당 field에서 keyword가 포함된 단어 5개를 List<String>로 얻어오기
		List<String> list = ingFundingListService.relatedWords(keyword, field);
		model.addAttribute("list", list);
		return list;
	}

	@RequestMapping(value = "/funding/searchHashtag")
	public String searchHashtag(String hashtag, Model model) {
		List<FundingVo> searchHashtag = ingFundingListService.searchHashtag(hashtag);
		model.addAttribute("list", searchHashtag);
		return ".ingFundingList";
	}
}
