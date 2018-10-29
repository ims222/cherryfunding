package com.cherryfunding.spring.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.cherryfunding.spring.util.S3Util;

@Controller
public class InsertImgController {
  
	@RequestMapping(value = "/insertImg", method = RequestMethod.POST)
	public String insertImg(MultipartFile file, HttpSession session) {
		System.out.println("살려주세요");
		String savefilename = null;
		String uploadPath = session.getServletContext().getRealPath("/resources/upload/");
		System.out.println("path: " + uploadPath);
		File f = new File(uploadPath);
		if (f.exists() == false) { // �뙆�씪 �깮�꽦
			f.mkdirs();
		}
		
		String orgfilename = file.getOriginalFilename();
		savefilename = Math.random() + "_" + orgfilename;
		try { // �궗吏꼋b���옣
			long filesize = file.getSize();
			if (filesize > 0) {
				System.out.println("orgfilename: " + orgfilename);
				System.out.println("savefilename:" + savefilename);

				InputStream is = file.getInputStream();
				FileOutputStream fos = new FileOutputStream(uploadPath + "\\" + savefilename);
				FileCopyUtils.copy(is, fos);
				is.close();
				fos.close();
			}
		} catch (Exception io) {
			System.out.println(io.getMessage());
			return "error";
		}
		return "/resources/upload" + savefilename;
	}
}
