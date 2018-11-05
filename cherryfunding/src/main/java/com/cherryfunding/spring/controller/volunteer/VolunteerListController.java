package com.cherryfunding.spring.controller.volunteer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryfunding.spring.service.volunteer.VolunteerListService;
import com.cherryfunding.spring.vo.VolunteerVo;

@Controller
public class VolunteerListController {
	@Autowired
	private VolunteerListService volunteerListService;
	
	@RequestMapping(value = "/volunteer/volunteerList", method = RequestMethod.GET)
	public String sharingList(Model model) {
		List<VolunteerVo> list = volunteerListService.list();
		for (VolunteerVo vo : list) {
			vo.setSaveName(volunteerListService.thumbnail(vo.getvNum()).getSaveName());
			vo.setVpInfo(volunteerListService.thumbnail(vo.getvNum()).getVpInfo());
		}
		model.addAttribute("list", list);

		return ".volunteerList";
	}
}
