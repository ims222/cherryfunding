package com.cherryfunding.spring.controller.volunteer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.volunteer.VListService;

@Controller
public class VolunteerApplicantController {

	@Autowired
	private VListService vListService;
	
	@RequestMapping(value = "/volunteer/applicantCount", method = RequestMethod.GET, produces = "text/plain")
	@ResponseBody
	public String VolunteerApplicant(int vNum) {	//해당 글의 신청인원 수 조회
		String count = Integer.toString(vListService.getTotal(vNum));
		return count;
	}
}
