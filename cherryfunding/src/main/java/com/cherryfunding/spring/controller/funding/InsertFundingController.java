package com.cherryfunding.spring.controller.funding;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cherryfunding.spring.service.funding.FHashtagService;
import com.cherryfunding.spring.service.funding.FPictureService;
import com.cherryfunding.spring.service.funding.FundingService;
import com.cherryfunding.spring.service.funding.RewardService;
import com.cherryfunding.spring.vo.FHashtagVo;
import com.cherryfunding.spring.vo.FPictureVo;
import com.cherryfunding.spring.vo.FundingVo;
import com.cherryfunding.spring.vo.RewardVo;

@Controller
public class InsertFundingController {
	@Autowired
	private FHashtagService fHashtagService;

	@Autowired
	private RewardService rewardService;

	@Autowired
	private FundingService fundingService;

	@Autowired
	private FPictureService fPictureService;
	
	@RequestMapping(value = "/funding/fundingApplication", method = RequestMethod.GET)
	public String fundingForm() {
		return ".inputFunding";
	}

	@RequestMapping(value = "/funding/fundingApplication", method = RequestMethod.POST)
	public String fundingApplication(MultipartHttpServletRequest request, HttpSession session) {
		String title = request.getParameter("title"); // 지원서 양식
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		String amount = request.getParameter("amount");
		String category = request.getParameter("category");
		String sDate = request.getParameter("sDate");
		String eDate = request.getParameter("eDate");
		String[] hashtags = request.getParameterValues("hashtag");
		String[] rewards = request.getParameterValues("reward");
		String[] prices = request.getParameterValues("price");
		String[] fpinfo = request.getParameterValues("fPinfo");

		int fnum = fundingService.getMaxNum() + 1; // 펀딩번호
		String uploadPath = session.getServletContext().getRealPath("/resources/upload");
		File f = new File(uploadPath);
		if (f.exists() == false) { // 파일 생성
			f.mkdirs();
		}
		try { // 펀딩저장
			FundingVo fvo = new FundingVo();
			fvo.setFnum(fnum);
			fvo.setTitle(title);
			fvo.setContent(content);
			fvo.setAmount(Integer.parseInt(amount));
			java.util.Date jsdate = new SimpleDateFormat("yyyy-mm-dd").parse(sDate);
			fvo.setSdate(new Date(jsdate.getTime()));
			java.util.Date jedate = new SimpleDateFormat("yyyy-mm-dd").parse(eDate);
			fvo.setEdate(new Date(jedate.getTime()));
			fvo.setCategory(category);
			fvo.setConfirm("n");
			fvo.setAddr("");
			fvo.setAid("");
			fvo.setId(id);
			fundingService.insert(fvo); // db

			for (String hashtag : hashtags) { // 해시태그 저장
				FHashtagVo fhvo = new FHashtagVo(fHashtagService.getMaxNum() + 1, fnum, hashtag);
				fHashtagService.insert(fhvo);
			}

			for (int ind = 0; ind < rewards.length; ind++) { // 리와드 저장
				RewardVo rvo = new RewardVo();
				rvo.setRnum(rewardService.getMaxNum() + 1);
				rvo.setFnum(fnum);
				rvo.setTitle(rewards[ind]);
				rvo.setPrice(Integer.parseInt(prices[ind]));
				rewardService.insert(rvo);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		List<MultipartFile> files = request.getFiles("fPicture");
		int num = 0;
		for (MultipartFile file : files) { // 사진들
			String orgfilename = file.getOriginalFilename();
			String savefilename = id + "_" + title + "_" + num + orgfilename;
			try { // 사진db저장
				long filesize = file.getSize();
				if (filesize > 0) {
					FPictureVo fpvo = new FPictureVo();
					fpvo.setFpNum(fPictureService.getMaxNum() + 1);
					fpvo.setfNum(fnum);
					fpvo.setSavename(savefilename);
					fpvo.setOrgname(orgfilename);
					fpvo.setFilesize(filesize);
					fpvo.setFpinfo(fpinfo[num++]);

					fPictureService.insert(fpvo); //저장
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
		}
		return "funding/application/fundingApplicationProcess";
	}
}
