package com.cherryfunding.spring.controller.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryfunding.spring.dao.RestKeyDao;
import com.cherryfunding.spring.util.S3Util;

@Controller
public class InfoController {

	@Autowired
	private RestKeyDao restKeyDao;

	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String Info(Model model) {
		S3Util s3Util = new S3Util(restKeyDao.getKeyValue("s3_accessKey"), restKeyDao.getKeyValue("s3_secretKey"));
		String img1 = s3Util.getFileURL("info/Crowdfunding2.jpg");
		String img2 = s3Util.getFileURL("info/Crowdfunding3.png");

		model.addAttribute("img1", img1);
		model.addAttribute("img2", img2);
		return ".info";
	}
}
