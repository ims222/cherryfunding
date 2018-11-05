package com.cherryfunding.spring.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryfunding.spring.service.funding.FundingConfirmService;
import com.cherryfunding.spring.vo.FundingVo;

@Controller
public class AdmypageController {
	
	@Autowired FundingConfirmService FundingConfirmService;
	@RequestMapping(value="/admypage",method=RequestMethod.GET)
	public String admypage() {
		
		return "admin/manage/adminPage";
	}
	
	@RequestMapping(value="/admypagea",method=RequestMethod.GET)
	public String admypagelist(Model model) {
		System.out.println("접근");
		List<FundingVo> vo= FundingConfirmService.waitList();
		model.addAttribute("vo",vo);
		
		return "admin/manage/confirm";
	}
	
	@RequestMapping(value="/confirmList",method=RequestMethod.GET)
	public String confirmList(Model model) {
		System.out.println("접근");
		List<FundingVo> vo= FundingConfirmService.confirmList();
		model.addAttribute("vo",vo);
		
		return "admin/manage/confirmList";
	}
	
	@RequestMapping(value="/admypage/wait",method=RequestMethod.GET)
	public String wait(int num) {
		System.out.println("접근");
		FundingConfirmService.wait(num);
		
		return "redirect:/confirmList";
	}
	
	
	
	
	@RequestMapping(value="/admypage/confirm",method=RequestMethod.GET)
	public String confirm(int num) {
		System.out.println("confirm 접근");
		FundingConfirmService.confirm(num);
		
		return "redirect:/admypagea";
		
	}

}
