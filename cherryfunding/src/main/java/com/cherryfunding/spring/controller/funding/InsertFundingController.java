package com.cherryfunding.spring.controller.funding;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cherryfunding.spring.service.funding.FundingService;
import com.cherryfunding.spring.service.funding.InsertFundingService;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.vo.FHashtagVo;
import com.cherryfunding.spring.vo.FundingVo;
import com.cherryfunding.spring.vo.RewardVo;

@Controller
public class InsertFundingController {
 
	@Autowired
	private InsertFundingService insertFundingService;

	@Autowired
	private FundingService fundingService;

	@RequestMapping(value = "/funding/fundingApplication", method = RequestMethod.GET)
	public String fundingForm() {
		return ".inputFunding";
	}

	@RequestMapping(value = "/funding/getFnum")
	@ResponseBody
	public int getFnum() {
		return fundingService.getMaxNum() + 1;
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

		try { // 펀딩저장

			for (String hashtag : hashtags) { // 해시태그 저장
				if (hashtag != null && !hashtag.equals("")) {
					FHashtagVo fhvo = new FHashtagVo(0, fvo.getfNum(), hashtag);
					insertFundingService.fhinsert(fhvo);
				}
			}

			for (int ind = 0; ind < rewards.length; ind++) { // 리와드 저장
				RewardVo rvo = new RewardVo();
				rvo.setfNum(fvo.getfNum());
				rvo.setTitle(rewards[ind]);
				rvo.setPrice(Integer.parseInt(prices[ind]));
				rvo.setAmount(Integer.parseInt(fAmount[ind]));
				insertFundingService.rinsert(rvo);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "redirect:/funding/ingFundingList";
	}
}
