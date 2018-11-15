package com.cherryfunding.spring.controller.user;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cherryfunding.spring.dao.UserSettingDao;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.vo.UserSettingVo;

@Controller
public class ProfileImgController {

	@Autowired
	private S3Util s3;

	@Autowired
	private UserSettingDao userSettingDao;

	@RequestMapping(value = "/users/imgUpload", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String imgUpload(MultipartHttpServletRequest request, HttpSession session) {
		JSONObject obj = new JSONObject();
		String id = (String) session.getAttribute("id");
		MultipartFile file = request.getFile("qqfile");
		try {
			String profile = userSettingDao.getInfo(id).getProfile();
			if (!profile.equals("default")) {
				s3.fileDelete("profile/" + profile);
			}
			profile = String.valueOf(UUID.randomUUID());
			UserSettingVo usvo = new UserSettingVo();
			usvo.setProfile(profile);
			usvo.setId(id);
			userSettingDao.update(usvo);
			s3.fileUpload("profile/" + profile, file.getBytes()); // 파일 업로드

			obj.put("success", "true");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			obj.put("success", "false");
		}
		return obj.toString();
	}

	@RequestMapping(value = "/users/getProfileImg", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getProfileImg(HttpSession session) {
		JSONObject obj = new JSONObject();
		String id = (String) session.getAttribute("id");
		String profile = userSettingDao.getInfo(id).getProfile();
		String savename = s3.getFileURL("profile/" + profile); // 파일이름 불러오기
		obj.put("savename", savename);
		return obj.toString();
	}
}
