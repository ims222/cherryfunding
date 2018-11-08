package com.cherryfunding.spring.batch;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.cherryfunding.spring.dao.VolunteerDao;


@Controller
public class VolunteerBatch {

	public VolunteerDao volunteerDao = new VolunteerDao(); 

	public void execute() {
		System.out.println("지난 봉사 제목 앞에 [마감] 붙이기");
		int max = volunteerDao.getMaxNum();
		System.out.println(max);
	}


}
