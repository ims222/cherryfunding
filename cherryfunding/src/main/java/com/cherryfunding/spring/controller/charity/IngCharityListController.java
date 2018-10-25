package com.cherryfunding.spring.controller.charity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryfunding.spring.service.charity.IngCharityListService;
import com.cherryfunding.spring.vo.CharityVo;


@Controller
public class IngCharityListController {
	@Autowired
	IngCharityListService ingCharityListService;

	@RequestMapping(value = "/support/ingSupportList", method = RequestMethod.GET)
	public String ingFundingList(Model model) {
		List<CharityVo> list = ingCharityListService.list();

		for (CharityVo vo : list) {
			vo.setSavename(ingCharityListService.thumbnail(vo.getcNum()).getSaveName());
			vo.setCpinfo(ingCharityListService.thumbnail(vo.getcNum()).getCpinfo());
		}

		model.addAttribute("list", list);
		return ".ingFundingList";
	}
}
