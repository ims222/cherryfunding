package com.cherryfunding.spring.controller.volunteer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryfunding.spring.dao.RestKeyDao;
import com.cherryfunding.spring.service.volunteer.VolunteerListService;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.vo.VolunteerVo;

@Controller
public class VolunteerListController {
	@Autowired
	private VolunteerListService volunteerListService;

	@Autowired
	private RestKeyDao restKeyDao;
 
	@RequestMapping(value = "/volunteer/volunteerList", method = RequestMethod.GET)
	public String sharingList(Model model) {
		List<VolunteerVo> list = volunteerListService.getFirstSix();
		for (VolunteerVo vo : list) {
			String thumbnail = volunteerListService.thumbnail(vo.getvNum()).getSaveName();
			S3Util s3Util = new S3Util(restKeyDao.getKeyValue("s3_accessKey"), restKeyDao.getKeyValue("s3_secretKey"));
			vo.setSaveName(s3Util.getFileURL("volunteer/" + thumbnail));
			vo.setVpInfo(volunteerListService.thumbnail(vo.getvNum()).getVpInfo());
		}
		model.addAttribute("list", list);
		return ".volunteerList";
	}
}
