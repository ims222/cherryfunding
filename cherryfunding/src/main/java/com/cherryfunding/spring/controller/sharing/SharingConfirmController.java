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
		int siNum = sharingConfirmService.slDetail(slNum).getSiNum();
		int amount = sharingConfirmService.slDetail(slNum).getAmount();
		int totAmount = sharingConfirmService.siDetail(siNum).getAmount();
		
		if(totAmount > amount) { //신청 수량 보다 남은 게 많으면
			sharingConfirmService.confirm(slNum);

			HashMap<String, Object> updateMap = new HashMap<String, Object>();
			updateMap.put("siNum", siNum);
			updateMap.put("amount", amount);
			sharingConfirmService.updateAmount(updateMap);// 남은 수량 수정
		}

		return "redirect:/sharing/sharingParticipation?sNum=" + sharingConfirmService.slDetail(slNum).getsNum();
	}
}
