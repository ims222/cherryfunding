package com.cherryfunding.spring.controller.funding;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.funding.FundingDetailService;
import com.cherryfunding.spring.vo.FDetailVo;
import com.cherryfunding.spring.vo.RewardVo;

@Controller
public class FundingDetailController {

	@Autowired
	private FundingDetailService fundingDetailService;

	@RequestMapping("/funding/fundingDetailforUser")
	public String fundingDetail(int fNum, Model model) {
		model.addAttribute("vo", fundingDetailService.detail(fNum));
		model.addAttribute("rewardList", fundingDetailService.rewardList(fNum));
		fundingDetailService.hitUp(fNum);
		return ".fundingDetailforUser";
	}

	@RequestMapping("/funding/rewardDetail")
	@ResponseBody
	public RewardVo rewardDetail(int rNum) {
		return fundingDetailService.rewardDetail(rNum);
	}

	@RequestMapping(value = "/funding/insertFDetail", method = RequestMethod.POST)
	public String insertFDetail(HttpSession session, HttpServletRequest request) {
		String id = (String) session.getAttribute("id");
		int fNum = Integer.parseInt(request.getParameter("fNum"));
		String[] srNum = request.getParameterValues("rNum");
		String[] samount = request.getParameterValues("amount");
		int[] rNum = new int[srNum.length];
		int[] amount = new int[samount.length];

		for (int i = 0; i < srNum.length; i++) {
			rNum[i] = Integer.parseInt(srNum[i]);
		}
		for (int i = 0; i < samount.length; i++) {
			amount[i] = Integer.parseInt(samount[i]);
		}
		for (int i = 0; i < rNum.length; i++) {
			FDetailVo fdvo = new FDetailVo();
			fdvo.setFdNum(fundingDetailService.getMaxNum() + 1);
			fdvo.setId(id);
			fdvo.setfNum(fNum);
			fdvo.setrNum(rNum[i]);
			fdvo.setAmount(amount[i]);
			fundingDetailService.insertFDetail(fdvo);
		}
		return "redirect:/funding/fundingDetailforUser?fNum=" + fNum;
	}
}
