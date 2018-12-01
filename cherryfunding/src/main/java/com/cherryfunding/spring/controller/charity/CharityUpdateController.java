package com.cherryfunding.spring.controller.charity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.charity.CharityUpdateService;
import com.cherryfunding.spring.service.funding.FundingUpdateService;
import com.cherryfunding.spring.vo.CharityVo;
import com.cherryfunding.spring.vo.FundingVo;

@Controller
public class CharityUpdateController {
 
	@Autowired
	private CharityUpdateService charityUpdateService;

	@RequestMapping("/charity/editContent")
	@ResponseBody
	public CharityVo editContent(CharityVo vo) {
		charityUpdateService.update(vo);
		return charityUpdateService.detail(vo.getcNum());
	}
}
