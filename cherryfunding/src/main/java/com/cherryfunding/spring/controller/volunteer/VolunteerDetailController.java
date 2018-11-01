package com.cherryfunding.spring.controller.volunteer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryfunding.spring.service.volunteer.VolunteerService;

@Controller
public class VolunteerDetailController {
	
	@Autowired
	private VolunteerService volunteerService;
	
	@RequestMapping(value="/volunteer/volunteerDetail", method=RequestMethod.GET)
	public String volunteerDetail(int vNum, Model model) {
		model.addAttribute("vo", volunteerService.detail(vNum));
		return ".VolunteerDetail";
	}
}
