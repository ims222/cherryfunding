package com.cherryfunding.spring.controller.charity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cherryfunding.spring.service.charity.PrepareCharityListService;
import com.cherryfunding.spring.vo.CharityVo;

@Controller
public class PrepareCharityListController {

	@Autowired
	private PrepareCharityListService prepareService;
	
	@RequestMapping("/charity/prepareCharityList")
	public String prepare(Model model) {
		List<CharityVo> list = prepareService.list();
		
		for (CharityVo vo : list) {
			vo.setSavename(prepareService.thumbnail(vo.getcNum()).getSaveName());
			vo.setCpinfo(prepareService.thumbnail(vo.getcNum()).getCpinfo());
		}

		model.addAttribute("list", list);
		return ".prepareFundingList";
	}
}
