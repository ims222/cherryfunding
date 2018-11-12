package com.cherryfunding.spring.controller.visit;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.charity.MainCharityService;
import com.cherryfunding.spring.service.funding.MainFundingService;
import com.cherryfunding.spring.service.visitor.VisitorService;

@Controller
public class VisitorController {
	
	@Autowired VisitorService VisitorService;
	/*@Autowired
	private MainCharityService mcService;

	@Autowired
	private MainFundingService mfService;*/
	
	
	@RequestMapping(value="/visitorstatistics",method=RequestMethod.GET)
	public String visitor(Model model,String today) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("today", today);
		
		int todaycount = VisitorService.dvisitorcount(today);//하루 일일 통계인원
		int ftotalprice=VisitorService.ftotalprice();//전체 펀딩 금액
		int ctotalprice=VisitorService.ctotalprice();//전체 기부모금 금액
		int tfprice=VisitorService.tfprice(today); // 오늘 모인 펀딩 금액
		int tcprice=VisitorService.tcprice(today);// 오늘 기부 모인 금액
		
		model.addAttribute("todaycount", todaycount);
		model.addAttribute("tcprice", tcprice);
		model.addAttribute("ftotalprice", ftotalprice);
		model.addAttribute("ctotalprice", ctotalprice);
		model.addAttribute("tfprice", tfprice);
		model.addAttribute("tcprice", tcprice);
		
		
		return "visitor/visitorstatistics";
	}
	
	
	@RequestMapping(value="/visitorr",method=RequestMethod.GET)
	@ResponseBody
	public String visitorstatistics(@RequestParam String dataText) {
		System.out.println("접근");
		String date = dataText;
		int result = VisitorService.dvisitorcount(date);
		String count = Integer.toString(result);
		return count;
		
	}

}
