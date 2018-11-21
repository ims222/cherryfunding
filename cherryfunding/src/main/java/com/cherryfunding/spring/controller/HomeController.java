package com.cherryfunding.spring.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryfunding.spring.service.charity.MainCharityService;
import com.cherryfunding.spring.service.funding.MainFundingService;

@Controller
public class HomeController {

	@Autowired
	private MainCharityService mcService;

	@Autowired
	private MainFundingService mfService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		HashMap<String, Object> summary = new HashMap<String, Object>();

		// 후원 요약
		summary.put("cEnd", mcService.mainEnd()); // 종료임박
		summary.put("cEndRecomm", mcService.getRecomm(mcService.mainEnd().getcNum()));
		summary.put("cNew", mcService.mainNew()); // 새로 시작하는 펀딩
		summary.put("cNewRecomm", mcService.getRecomm(mcService.mainNew().getcNum()));
		summary.put("cHot", mcService.mainHot()); // 진행중 펀딩중 조회수가 가장 높은
		summary.put("cHotRecomm", mcService.getRecomm(mcService.mainHot().getcNum()));
		summary.put("cPrice", mcService.mainPrice()); // 진행중 펀딩중 참여금액이 제일 높은
		summary.put("cPriceRecomm", mcService.getRecomm(mcService.mainPrice().getcNum()));
		summary.put("totCharity", mcService.totCharity());
		summary.put("todayCharityPrice", mcService.todayCharityPrice());
		summary.put("todayCharityCount", mcService.todayCharityCount());

		// 펀딩 요약
		summary.put("fEnd", mfService.mainEnd()); // 종료임박
		summary.put("fEndRecomm", mfService.getRecomm(mfService.mainEnd().getfNum()));
		summary.put("fNew", mfService.mainNew()); // 새로 시작하는 펀딩
		summary.put("fNewRecomm", mfService.getRecomm(mfService.mainNew().getfNum()));
		summary.put("fHot", mfService.mainHot()); // 진행중 펀딩중 조회수가 가장 높은
		summary.put("fHotRecomm", mfService.getRecomm(mfService.mainHot().getfNum()));
		summary.put("fPrice", mfService.mainPrice()); // 진행중 펀딩중 참여금액이 제일 높은
		summary.put("fPriceRecomm", mfService.getRecomm(mfService.mainPrice().getfNum()));
		summary.put("totFunding", mfService.totFunding());
		summary.put("todayFundingPrice", mfService.todayFundingPrice()); // 오늘 펀딩 금액
		summary.put("todayFundingCount", mfService.todayFundingCount()); // 오늘 펀딩 갯수
		model.addAttribute("summary", summary);

		return ".main";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adhome() {
		return ".admin";
	}

}
