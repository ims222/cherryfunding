package com.cherryfunding.spring.controller;

import java.util.UUID;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cherryfunding.spring.util.S3Util;

@Controller
public class ImgUpload {

	@Autowired
	private S3Util s3;

//	qqfilename
//	qquuid
//	qqtotalfilesize
//	qqfile

	@RequestMapping(value = "/imgUpload", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String imgUpload(MultipartHttpServletRequest request) {
		JSONObject obj = new JSONObject();
		MultipartFile file = request.getFile("qqfile");
		try {
			String orgName = file.getOriginalFilename();
			System.out.println(orgName);
			String saveName = UUID.randomUUID() + "";
			s3.fileUpload(saveName, file.getBytes()); // 파일 업로드
			System.out.println((s3.getFileURL(saveName))); // 파일이름 불러오기
			obj.put("success", "true");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			obj.put("success", "false");
		}
		return obj.toString();
	}
}
