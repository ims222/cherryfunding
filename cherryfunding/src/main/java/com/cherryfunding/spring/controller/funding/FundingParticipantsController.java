package com.cherryfunding.spring.controller.funding;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.funding.FundingParticipantsService;
import com.cherryfunding.spring.vo.FDetailVo;

@Controller
public class FundingParticipantsController {

	@Autowired
	private FundingParticipantsService fundingParticipantsService;

	@RequestMapping("/funding/fundingParticipation")
	public String fundingParticipation(int fNum, Model model) {
		model.addAttribute("fNum", fNum);
		return "funding/fundingBoard/fundingParticipants";
	}

	@RequestMapping("/funding/fundingParticipants")
	@ResponseBody
	public HashMap<String, List<FDetailVo>> fundingParticipants(int fNum) {
		List<FDetailVo> list = fundingParticipantsService.listByfNum(fNum);

		HashMap<String, List<FDetailVo>> listByUsers = new HashMap<String, List<FDetailVo>>();
		for (FDetailVo vo : list) {
			String id = vo.getId();
			if (!listByUsers.containsKey(id)) {
				listByUsers.put(id, new ArrayList<FDetailVo>());
			}
			listByUsers.get(id).add(vo);
		}
		return listByUsers;
	}
}
