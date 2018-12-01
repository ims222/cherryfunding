package com.cherryfunding.spring.controller.sharing;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.sharing.SharingParticipantsService;

@Controller
public class SharingParticipantsController {

	@Autowired
	SharingParticipantsService sharingParticipantsService;
 
	@RequestMapping("/sharing/sharingParticipation")
	public String fundingParticipation(int sNum, Model model) { // 펀딩 참여자 목록
		model.addAttribute("sNum", sNum);
		return ".sharingParticipants";
	}

	@RequestMapping("/sharing/sharingParticipants")
	@ResponseBody
	public List<HashMap<String, Object>> sharingParticipants(int sNum) {
		List<HashMap<String, Object>> list = sharingParticipantsService.listBysNum(sNum);
		for (HashMap<String, Object> map : list) {
			String id = (String) map.get("ID");
			String nick = sharingParticipantsService.usersInfo(id).getNick();
			map.put("nick", nick); // 닉네임
		}
		return list;
	}

	@RequestMapping("/sharing/sharingConfirmList")
	@ResponseBody
	public List<HashMap<String, Object>> isConfirm(int sNum) {
		List<HashMap<String, Object>> list = sharingParticipantsService.isConfirm(sNum);
		for (HashMap<String, Object> map : list) {
			String id = (String) map.get("ID");
			String nick = sharingParticipantsService.usersInfo(id).getNick();
			map.put("nick", nick); // 닉네임
		}
		return list;
	}
}
