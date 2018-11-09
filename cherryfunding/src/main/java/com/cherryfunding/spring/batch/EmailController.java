package com.cherryfunding.spring.batch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.cherryfunding.spring.service.volunteer.VolunteerService;

@Controller
public class EmailController {
	
	@Autowired
	private VolunteerService volunteerService;

	public void method() {	
		
	}
}
