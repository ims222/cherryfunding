package com.cherryfunding.spring.controller.charity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cherryfunding.spring.service.charity.EndCharityListService;
import com.cherryfunding.spring.vo.CharityVo;

@Controller
public class EndCharityListController {

	@Autowired
	private EndCharityListService endService;

	@RequestMapping("/charity/endCharityList")
	public String end(Model model) {
		List<CharityVo> list = endService.list();

		for (CharityVo vo : list) {
			vo.setSavename(endService.thumbnail(vo.getcNum()).getSaveName());
			vo.setCpinfo(endService.thumbnail(vo.getcNum()).getCpinfo());
		}

		model.addAttribute("list", list);
		return ".endCharityList";
	}
}
