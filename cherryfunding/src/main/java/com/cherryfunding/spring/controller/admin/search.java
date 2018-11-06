package com.cherryfunding.spring.controller.admin;

import java.text.CharacterIterator;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryfunding.spring.service.charity.SearchCharityService;
import com.cherryfunding.spring.service.funding.SearchFundingService;
import com.cherryfunding.spring.vo.CharityVo;
import com.cherryfunding.spring.vo.FundingVo;

@Controller
public class search {
	
	@Autowired SearchCharityService SearchCharityService; 
	@Autowired SearchFundingService SearchFundingService;
	
	
	@RequestMapping(value="/admin/wsearch",method=RequestMethod.POST)
	public String Wsearch(Model model , HttpServletRequest request) {
		
		String kinds = request.getParameter("kinds");
		String keyword = request.getParameter("keyword");
		HashMap<String, String> map = new HashMap<String,String>();
		
		if(kinds.equals("chirty")) {
		
			String field= request.getParameter("field");
			map.put("field", field);
			map.put("keyword", keyword);
			List<CharityVo> co=SearchCharityService.searchwaitList(map);
			model.addAttribute("co", co);
			return "admin/manage/confirm";
			
		}else if(kinds.equals("funding")){
			
			String field= request.getParameter("field");
			map.put("field", field);
			map.put("keyword",keyword);
			List<FundingVo> vo = SearchFundingService.searchwaitList(map); 
			model.addAttribute("vo", vo);
			return "admin/manage/confirm";
		}
		
		return "";
		
	}
	
	@RequestMapping(value="/admin/csearch",method=RequestMethod.POST)
	public String Csearch(Model model , HttpServletRequest request) {
		
		String kinds = request.getParameter("kinds");
		String keyword = request.getParameter("keyword");
		HashMap<String, String> map = new HashMap<String,String>();
		
		if(kinds.equals("chirty")) {
		
			String field= request.getParameter("field");
			map.put("field", field);
			map.put("keyword", keyword);
			List<CharityVo> co=SearchCharityService.searchconfirmList(map);
			model.addAttribute("co", co);
			return "admin/manage/confirmList";
			
		}else if(kinds.equals("funding")){
			
			String field= request.getParameter("field");
			map.put("field", field);
			map.put("keyword",keyword);
			List<FundingVo> vo = SearchFundingService.searchconfirmList(map); 
			model.addAttribute("vo", vo);
			return "admin/manage/confirmList";
		}
		
		return "";
		
	}

}
