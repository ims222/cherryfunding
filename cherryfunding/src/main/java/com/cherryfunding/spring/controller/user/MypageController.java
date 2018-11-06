package com.cherryfunding.spring.controller.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryfunding.spring.service.user.MypageService;
import com.cherryfunding.spring.vo.MypageVo;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mpService;
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session,Model model) {
		String id=(String)session.getAttribute("id");
		int charitySum=mpService.charitySum(id);
		int fundingSum=mpService.fundingSum(id);
		int balance=mpService.nowBalance(id);
		List<MypageVo> charityList = mpService.charityList(id);
		List<MypageVo> fundingList = mpService.fundingList(id);
		model.addAttribute("charitySum",charitySum);
		model.addAttribute("fundingSum",fundingSum);
		model.addAttribute("charityList",charityList);
		model.addAttribute("fundingList",fundingList);
		model.addAttribute("balance",balance);
		return "user/userInfo/mypage";
	}
}
