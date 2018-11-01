package com.cherryfunding.spring.controller.volunteer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.cherryfunding.spring.service.volunteer.VolunteerListService;
import com.cherryfunding.spring.service.volunteer.VolunteerService;

import com.cherryfunding.spring.vo.VPictureVo;
import com.cherryfunding.spring.vo.VolunteerVo;

@Controller
public class VolunteerListController {
	@Autowired
	private VolunteerListService volunteerListService;
	
	@Autowired
	private VolunteerService volunteerService;
	
	@RequestMapping(value = "/volunteer/volunteerList", method = RequestMethod.GET)
	public String sharingList(Model model) {

		List<VPictureVo> list = volunteerListService.list();	//사진 썸네일

		for (VPictureVo vo : list) {
			vo.setSaveName(volunteerListService.thumbnail(vo.getvNum()).getSaveName());
			vo.setVpInfo(volunteerListService.thumbnail(vo.getvNum()).getVpInfo());
		}
		
		List<VolunteerVo> list2 = volunteerService.list();

		model.addAttribute("PList", list);
		model.addAttribute("list", list2);
		return "/volunteer/volunteerBoard/volunteerList";
	}
}
