package com.cherryfunding.spring.controller.charity;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.dao.RestKeyDao;
import com.cherryfunding.spring.dao.UserSettingDao;
import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.service.charity.CharityParticipantsService;
import com.cherryfunding.spring.service.funding.FundingParticipantsService;
import com.cherryfunding.spring.util.S3Util;

@Controller
public class CharityParticipantsController {

	@Autowired
	private RestKeyDao restKeyDao;

	@Autowired
	private UserSettingDao userSettingDao;

	@Autowired
	private CharityParticipantsService charityParticipantsService;

	@RequestMapping("/charity/charityParticipation")
	public String charityParticipation(int cNum, Model model) { // 펀딩 참여자 목록
		model.addAttribute("cNum", cNum);
		return ".charityParticipants";
	}

	@RequestMapping("/charity/charityParticipants")
	@ResponseBody
	public List<HashMap<String, Object>> charityParticipants(int cNum) { // 펀딩 참여자 목록
		List<HashMap<String, Object>> list = charityParticipantsService.listBycNum(cNum);
		for (HashMap<String, Object> map : list) {
			String id = (String) map.get("ID");
			String nick = charityParticipantsService.usersInfo(id).getNick();
			map.put("nick", nick); // 닉네임
			String profile = userSettingDao.getInfo(id).getProfile();
			S3Util s3Util = new S3Util(restKeyDao.getKeyValue("s3_accessKey"), restKeyDao.getKeyValue("s3_secretKey"));
			String savename = s3Util.getFileURL("profile/" + profile);
			map.put("savename", savename);
		}
		return list;
	}
}
