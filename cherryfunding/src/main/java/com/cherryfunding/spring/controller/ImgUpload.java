package com.cherryfunding.spring.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cherryfunding.spring.util.S3Util;

@Controller
public class ImgUpload {

	@RequestMapping(value = "/imgUpload", method = RequestMethod.POST)
	public String imgUpload(MultipartHttpServletRequest request, Model model) {
		S3Util s3util = new S3Util();
		List<MultipartFile> files = request.getFiles("file");
		ArrayList<String> filenames = new ArrayList<String>();
		for (MultipartFile file : files) {
			try {
				String orgName = file.getOriginalFilename();
				String exe = orgName.substring(orgName.lastIndexOf("."), orgName.length());
				String saveName = UUID.randomUUID() + "_" + exe;
				s3util.fileUpload("/funding/" + saveName, file.getBytes()); // 파일 업로드
				filenames.add(s3util.getFileURL("/funding/" + saveName)); // 파일이름 불러오기
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		model.addAttribute("filenames", filenames);
		return "cicadas";
	}
}
