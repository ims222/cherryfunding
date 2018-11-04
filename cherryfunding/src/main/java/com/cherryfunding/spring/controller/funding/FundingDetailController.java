package com.cherryfunding.spring.controller.funding;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

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
		model.addAttribute("fRecommend", fundingDetailService.getRecommend(fNum));
		model.addAttribute("hashtag", fundingDetailService.hashtag(fNum));
		fundingDetailService.hitUp(fNum);
		return ".fundingDetailforUser";
	}

	@RequestMapping("/funding/rewardDetail")
	@ResponseBody
	public RewardVo rewardDetail(int rNum) {
		return fundingDetailService.rewardDetail(rNum);
	}

	@RequestMapping(value = "/funding/getAmount")
	@ResponseBody
	public HashMap<String, Object> getAmount(int rNum, int amount, int fNum, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int getAmount = fundingDetailService.getAmount(rNum);
		RewardVo rvo = fundingDetailService.rewardDetail(rNum);

		if (session.getAttribute("selectedFundingList") == null) {
			session.setAttribute("selectedFundingList", new ArrayList<Object>());
		}
		int addAmount = amount;
		ArrayList<Object> list = (ArrayList<Object>) session.getAttribute("selectedFundingList");
		for (Object l : list) {
			HashMap<String, Object> sel = (HashMap<String, Object>) l;
			if ((Integer) sel.get("rNum") == rNum) {
				addAmount += (Integer) sel.get("amount");
			}
		}
		if (getAmount >= addAmount) { // 선택한 것들이 남은 수량보다 적으면
			map.put("result", "ok");
			map.put("rNum", rvo.getrNum());
			map.put("title", rvo.getTitle());
			map.put("price", rvo.getPrice());
			map.put("amount", rvo.getAmount());

			HashMap<String, Object> selected = new HashMap<String, Object>(); // 쇼핑 리스트에 담아요
			selected.put("rNum", rNum);
			selected.put("fNum", fNum);
			selected.put("title", rvo.getTitle());
			selected.put("amount", amount);
			list.add(selected);
		} else
			map.put("result", "no"); // 많으면 안 담아요
		return map;
	}

	@RequestMapping(value = "/funding/getSelectedFundingList")
	@ResponseBody
	public ArrayList<Object> getSelectedFundingList(int fNum, HttpSession session) {
		ArrayList<Object> list = (ArrayList<Object>) session.getAttribute("selectedFundingList");
		ArrayList<Object> selectedList = new ArrayList<Object>();
		if (list != null) {
			for (Object l : list) {
				HashMap<String, Object> map = (HashMap<String, Object>) l;
				if ((Integer) map.get("fNum") == fNum) {
					selectedList.add(map);
				}
			}
		}
		return selectedList;
	}

	@RequestMapping(value = "/funding/cancelSelectReward")
	@ResponseBody
	public HashMap<String, Object> cancelSelectReward(int i, HttpSession session) {
		ArrayList<Object> list = (ArrayList<Object>) session.getAttribute("selectedFundingList");
		HashMap<String, Object> map = (HashMap<String, Object>) list.remove(i);
		session.removeAttribute("selectedFundingList");
		session.setAttribute("selectedFundingList", list);
		return map;
	}

	@RequestMapping(value = "/funding/insertFDetail", method = RequestMethod.POST)
	public String insertFDetail(HttpSession session, HttpServletRequest request) {
		String id = (String) session.getAttribute("id");
		int fNum = Integer.parseInt(request.getParameter("fNum"));
		ArrayList<Object> list = (ArrayList<Object>) session.getAttribute("selectedFundingList");
		Iterator iterator = list.iterator();

		while (iterator.hasNext()) {
			HashMap<String, Object> map = (HashMap<String, Object>) iterator.next();
			if ((Integer) map.get("fNum") == fNum) {
				int rNum = (Integer) map.get("rNum");
				int amount = (Integer) map.get("amount");

				FDetailVo fdvo = new FDetailVo(0, id, fNum, rNum, null, null, amount);
				fundingDetailService.insertFDetail(fdvo); // 펀딩내역
				HashMap<String, Object> rewardMap = new HashMap<String, Object>();
				rewardMap.put("price", fundingDetailService.rewardDetail(rNum).getPrice());
				rewardMap.put("fNum", fNum);
				fundingDetailService.addCamout(rewardMap); // 현재금액 추가
				rewardMap.clear();
				rewardMap.put("rNum", rNum);
				rewardMap.put("amount", amount);
				fundingDetailService.updateAmount(rewardMap); // 남은 수량 수정
				iterator.remove(); // 리워드 지우기
			}
		}
		return "redirect:/funding/fundingDetailforUser?fNum=" + fNum;
	}
}
