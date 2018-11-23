package com.cherryfunding.spring.controller.funding;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cherryfunding.spring.service.charity.CharityConfirmService;
import com.cherryfunding.spring.service.funding.FundingConfirmService;

@Controller
public class FundingConfirmController {

	@Autowired
	private FundingConfirmService fundingConfirmService;

	@Autowired
	private CharityConfirmService charityConfirmService;

	@RequestMapping("/funding/waitList")
	public String waitList(Model model) {
		model.addAttribute("waitListFunding", fundingConfirmService.waitList());
		model.addAttribute("fundingList", fundingConfirmService.confirmList());
		model.addAttribute("waitListCharity", charityConfirmService.waitList());
		model.addAttribute("charityList", charityConfirmService.confirmList());
		return "confirm";
	}

	@RequestMapping("/funding/confirm")
	public String confirmFunding(int fNum) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		fundingConfirmService.confirm(map);
		return "redirect:/funding/waitList";
	}

	@RequestMapping("/funding/detail")
	public String fundingDetail(int fNum, Model model) {
		model.addAttribute("vo", fundingConfirmService.detail(fNum));
		model.addAttribute("fPictureList", fundingConfirmService.fPictureList(fNum));
		return "funding/application/fundingEdit";
	}

	@RequestMapping("/funding/confirmCancel")
	public String fundingConfirmCancel(int fNum) {
		fundingConfirmService.wait(fNum);
		return "redirect:/funding/waitList";
	}

	@RequestMapping("/charity/confirm")
	public String confirmCharity(int cNum) {
		charityConfirmService.confirm(cNum);
		return "redirect:/funding/waitList";
	}

	@RequestMapping("/charity/confirmCancel")
	public String charityConfirmCancel(int cNum) {
		charityConfirmService.wait(cNum);
		return "redirect:/funding/waitList";
	}

	@RequestMapping("/charity/delete")
	public String deleteCharity(int cNum) {
		charityConfirmService.wait(cNum);
		return "redirect:/funding/waitList";
	}

}
