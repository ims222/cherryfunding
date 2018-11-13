package com.cherryfunding.spring.controller.visit;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cherryfunding.spring.service.funding.FundingService;
import com.cherryfunding.spring.service.funding.InsertFundingService;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.vo.FHashtagVo;
import com.cherryfunding.spring.vo.FPictureVo;
import com.cherryfunding.spring.vo.FundingVo;
import com.cherryfunding.spring.vo.RewardVo;

@Controller
public class InsertFundingController {

	@Autowired
	private FundingService fundingService;

	@Autowired
	private InsertFundingService insertFundingService;

	@Autowired
	private S3Util s3;

	@RequestMapping(value = "/funding/fundingApplication", method = RequestMethod.GET)
	public String fundingForm() {
		return ".inputFunding";
	}

	@RequestMapping(value = "/funding/fundingApplication", method = RequestMethod.POST)
	public String fundingApplication(@ModelAttribute("fvo") @Valid FundingVo fvo, BindingResult result,
			MultipartHttpServletRequest request, HttpSession session) {
		if (result.hasErrors()) {
			return ".inputFunding";
		}
		String[] hashtags = request.getParameterValues("hashtag");
		String[] rewards = request.getParameterValues("reward");
		String[] fAmount = request.getParameterValues("fAmount");
		String[] prices = request.getParameterValues("price");
		String[] fpinfo = request.getParameterValues("fPinfo");

		int fNum = fundingService.getMaxNum() + 1; // 펀딩번호
		try { // 펀딩저장
			fvo.setfNum(fNum);
			insertFundingService.finsert(fvo); // db

			for (String hashtag : hashtags) { // 해시태그 저장
				if (hashtag != null && !hashtag.equals("")) {
					FHashtagVo fhvo = new FHashtagVo(0, fNum, hashtag);
					insertFundingService.fhinsert(fhvo);
				}
			}

			for (int ind = 0; ind < rewards.length; ind++) { // 리와드 저장
				RewardVo rvo = new RewardVo();
				rvo.setfNum(fNum);
				rvo.setTitle(rewards[ind]);
				rvo.setPrice(Integer.parseInt(prices[ind]));
				rvo.setAmount(Integer.parseInt(fAmount[ind]));
				insertFundingService.rinsert(rvo);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		try {
			List<MultipartFile> files = request.getFiles("fPicture");
			int num = 0;
			for (MultipartFile file : files) { // 사진들
				String orgfilename = file.getOriginalFilename();
				String savefilename = String.valueOf(UUID.randomUUID());
				long filesize = file.getSize();
				if (filesize > 0) { // 사진db저장
					FPictureVo fpvo = new FPictureVo();
					fpvo.setfNum(fNum);
					fpvo.setSavename(savefilename);
					fpvo.setOrgname(orgfilename);
					fpvo.setFilesize(filesize);
					fpvo.setFpinfo(fpinfo[num++]);
					insertFundingService.fpinsert(fpvo); // 저장
					s3.fileUpload("funding/" + savefilename, file.getBytes()); // 파일 업로드
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}

		return "redirect:/funding/ingFundingList";
	}
}