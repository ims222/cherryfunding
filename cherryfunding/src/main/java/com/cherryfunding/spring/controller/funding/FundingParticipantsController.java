package com.cherryfunding.spring.controller.funding;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.funding.FundingParticipantsService;

@Controller
public class FundingParticipantsController {

	@Autowired
	private FundingParticipantsService fundingParticipantsService;

	@RequestMapping("/funding/fundingParticipation")
	public String fundingParticipation(int fNum, Model model) { // 펀딩 참여자 목록
		model.addAttribute("fNum", fNum);
		return ".fundingParticipants";
	}

	@RequestMapping("/funding/fundingParticipants")
	@ResponseBody
	public List<HashMap<String, Object>> fundingParticipants(int fNum) { // 펀딩 참여자 목록
		List<HashMap<String, Object>> list = fundingParticipantsService.listByfNum(fNum);
		for (HashMap<String, Object> map : list) {
			String id = (String) map.get("ID");
			String nick = fundingParticipantsService.usersInfo(id).getNick();
			map.put("nick", nick); // 닉네임
		}
		return list;
	}
}
