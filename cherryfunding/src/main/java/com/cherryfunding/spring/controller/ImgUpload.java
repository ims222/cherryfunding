package com.cherryfunding.spring.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.UUID;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cherryfunding.spring.dao.RestKeyDao;
import com.cherryfunding.spring.service.funding.FundingService;
import com.cherryfunding.spring.service.funding.InsertFundingService;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.vo.FPictureVo;
import com.cherryfunding.spring.vo.FundingVo;

@Controller
public class ImgUpload {

	@Autowired
	private RestKeyDao restKeyDao;

	@Autowired
	private InsertFundingService insertFundingService;

//	qqfilename
//	qquuid
//	qqtotalfilesize
//	qqfile

	@RequestMapping(value = "/imgUpload", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String imgUpload(MultipartHttpServletRequest request) {
		JSONObject obj = new JSONObject();

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		int amount = Integer.parseInt(request.getParameter("amount"));
		String[] dateRange = request.getParameter("dateRange").replaceAll(" ", "").split("-");
		String uid = request.getParameter("uid");
		int index = Integer.parseInt(request.getParameter("index"));
		int fNum = Integer.parseInt(request.getParameter("fNum"));

		MultipartFile file = request.getFile("qqfile");
		String orgfilename = file.getOriginalFilename();
		String savefilename = String.valueOf(UUID.randomUUID());
		long filesize = file.getSize();
		try {
			if (index == 0) {
				String sDate = dateRange[0].replaceAll("/", "-");
				String eDate = dateRange[1].replaceAll("/", "-");
				FundingVo fvo = new FundingVo();
				fvo.setfNum(fNum);
				fvo.setTitle(title);
				fvo.setContent(content);
				fvo.setAmount(amount);
				fvo.setCategory(category);
				fvo.setId(uid);
				java.util.Date jsdate = new SimpleDateFormat("yyyy-MM-dd").parse(sDate);
				fvo.setSdate(new Date(jsdate.getTime()));
				java.util.Date jedate = new SimpleDateFormat("yyyy-MM-dd").parse(eDate);
				fvo.setEdate(new Date(jedate.getTime()));
				insertFundingService.finsert(fvo); // db
			}
			String caption = request.getParameter("caption");
			S3Util s3Util = new S3Util(restKeyDao.getKeyValue("s3_accessKey"), restKeyDao.getKeyValue("s3_secretKey"));
			s3Util.fileUpload("funding/" + savefilename, file.getBytes()); // 파일 업로드

			FPictureVo fpvo = new FPictureVo();
			fpvo.setfNum(fNum);
			fpvo.setSavename(savefilename);
			fpvo.setOrgname(orgfilename);
			fpvo.setFilesize(filesize);
			fpvo.setFpinfo(caption);
			insertFundingService.fpinsert(fpvo); // 저장
		} catch (Exception e) {
			System.out.println(e.getMessage());
			obj.put("success", "false");
		}

		obj.put("success", "true");
		return obj.toString();
	}
}
