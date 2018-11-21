package com.cherryfunding.spring.controller.charity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cherryfunding.spring.service.charity.CharityDetailService;

@Controller
public class CharityDetailController {

	@Autowired
	private CharityDetailService charityDetailService;

	@RequestMapping("/Charity/ingCharityDetailforUser")
	public String ingCharityDetail(int cNum, Model model) {
		model.addAttribute("vo", charityDetailService.detail(cNum));
		//model.addAttribute("fRecommend", CharityDetailService.getRecommend(fNum));
		model.addAttribute("hashtag", charityDetailService.hashtag(cNum));
		//model.addAttribute("countSupporter", CharityDetailService.countFdetailbyfNum(fNum));
		charityDetailService.hitUp(cNum);
		return ".ingCharityDetailforUser";
	}


	@RequestMapping("/Charity/prepareCharityDetailforUser")
	public String prepareCharityDetail(int cNum, Model model) {
		model.addAttribute("vo", charityDetailService.detail(cNum));
		//model.addAttribute("fRecommend", CharityDetailService.getRecommend(fNum));
		model.addAttribute("hashtag", charityDetailService.hashtag(cNum));
		//model.addAttribute("countSupporter", CharityDetailService.countFdetailbyfNum(fNum));
		charityDetailService.hitUp(cNum);
		return ".prepareCharityDetailforUser";
	}

	@RequestMapping("/Charity/endCharityDetailforUser")
	public String endCharityDetail(int cNum, Model model) {
		model.addAttribute("vo", charityDetailService.detail(cNum));
		//model.addAttribute("fRecommend", CharityDetailService.getRecommend(fNum));
		model.addAttribute("hashtag", charityDetailService.hashtag(cNum));
		//model.addAttribute("countSupporter", CharityDetailService.countFdetailbyfNum(fNum));
		charityDetailService.hitUp(cNum);
		return ".endCharityDetailforUser";
	}
}
