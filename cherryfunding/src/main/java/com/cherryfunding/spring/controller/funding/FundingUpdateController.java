package com.cherryfunding.spring.controller.funding;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.funding.FundingUpdateService;

@Controller
public class FundingUpdateController {

	@Autowired
	private FundingUpdateService fundingUpdateService;

	@RequestMapping("/funding/editContent")
	@ResponseBody
	public HashMap<String, Object> editContent(int fNum, String content) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fNum", fNum);
		map.put("content", content);
		fundingUpdateService.editContent(map);
		return map;
	}
}
