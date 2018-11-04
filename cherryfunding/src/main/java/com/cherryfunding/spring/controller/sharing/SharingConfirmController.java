package com.cherryfunding.spring.controller.sharing;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cherryfunding.spring.service.sharing.SharingConfirmServiceImpl;

@Controller
public class SharingConfirmController {

	@Autowired
	private SharingConfirmServiceImpl sharingConfirmService;

	@RequestMapping("/shring/sharingConfirm")
	public String sharingConfirm(int slNum) {
		sharingConfirmService.confirm(slNum);

		HashMap<String, Object> updateMap = new HashMap<String, Object>();
		updateMap.put("siNum", sharingConfirmService.select(slNum).getSiNum());
		updateMap.put("amount", sharingConfirmService.select(slNum).getAmount());
		sharingConfirmService.updateAmount(updateMap);// 남은 수량 수정
		return "redirect:/sharing/sharingParticipation?sNum=" + sharingConfirmService.select(slNum).getsNum();
	}
}
