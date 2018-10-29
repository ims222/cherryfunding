package com.cherryfunding.spring.controller.volunteer;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class InsertVolunteerController {

	@RequestMapping(value = "/volunteer/insertVolunteer", method = RequestMethod.GET)
	public String insertVolunteerForm() {
		return ".insertVolunteer";
	}

	@RequestMapping(value = "/volunteer/insertVolunteer", method = RequestMethod.POST)
	public String insertVolunteer(MultipartHttpServletRequest request, HttpSession session) {
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		String dDay = request.getParameter("dDay");
		String members = request.getParameter("members");
		String place = request.getParameter("place");
		String[] vPinfo = request.getParameterValues("vPinfo");
		
		List<MultipartFile> files = request.getFiles("vPicture");
		
		
		
		return ".volunteerList";
	}
}
