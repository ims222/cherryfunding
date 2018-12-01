package com.cherryfunding.spring.controller.funding;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.funding.FundingDetailService;
import com.cherryfunding.spring.vo.FDetailVo;
import com.cherryfunding.spring.vo.FResultVo;
import com.cherryfunding.spring.vo.RewardVo;
import com.cherryfunding.spring.vo.UsersVo;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class FundingDetailController {
 
	@Autowired
	private FundingDetailService fundingDetailService;

	@RequestMapping("/funding/ingFundingDetailforUser")
	public String ingFundingDetail(int fNum, Model model) {
		model.addAttribute("vo", fundingDetailService.detail(fNum));
		model.addAttribute("rewardList", fundingDetailService.rewardList(fNum));
		model.addAttribute("fRecommend", fundingDetailService.getRecommend(fNum));
		model.addAttribute("hashtag", fundingDetailService.hashtag(fNum));
		model.addAttribute("countSupporter", fundingDetailService.countFdetailbyfNum(fNum));
		model.addAttribute("savename", fundingDetailService.thumbnailString(fNum));
		fundingDetailService.hitUp(fNum);
		return ".ingFundingDetailforUser";
	}
	
	@RequestMapping("/funding/getRewardList")
	@ResponseBody
	public List<RewardVo> getRewardList(int fNum) {
		return fundingDetailService.rewardList(fNum);
	}

	@RequestMapping("/funding/rewardList")
	public String rewardList(@ModelAttribute("fNum") int fNum, Model model) { // 리워드 리스트
		model.addAttribute("vo", fundingDetailService.detail(fNum));
		model.addAttribute("rewardList", fundingDetailService.rewardList(fNum));
		return ".rewardProcess";
	}

	@RequestMapping("/funding/prepareFundingDetailforUser")
	public String prepareFundingDetail(int fNum, Model model) {
		model.addAttribute("vo", fundingDetailService.detail(fNum));
		model.addAttribute("rewardList", fundingDetailService.rewardList(fNum));
		model.addAttribute("fRecommend", fundingDetailService.getRecommend(fNum));
		model.addAttribute("hashtag", fundingDetailService.hashtag(fNum));
		model.addAttribute("countSupporter", fundingDetailService.countFdetailbyfNum(fNum));
		fundingDetailService.hitUp(fNum);
		return ".prepareFundingDetailforUser";
	}

	@RequestMapping("/funding/endFundingDetailforUser")
	public String endFundingDetail(int fNum, Model model) {
		model.addAttribute("vo", fundingDetailService.detail(fNum));
		model.addAttribute("rewardList", fundingDetailService.rewardList(fNum));
		model.addAttribute("fRecommend", fundingDetailService.getRecommend(fNum));
		model.addAttribute("hashtag", fundingDetailService.hashtag(fNum));
		model.addAttribute("countSupporter", fundingDetailService.countFdetailbyfNum(fNum));
		fundingDetailService.hitUp(fNum);
		return ".endFundingDetailforUser";
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
		return "redirect:/funding/ingFundingDetailforUser?fNum=" + fNum;
	}

	@RequestMapping(value = "/funding/applicationReward", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String applicationReward(int fNum, HttpSession session, Model model, HttpServletRequest request) {
		String id = (String) session.getAttribute("id");
		String reward = request.getParameter("reward");
		JSONObject obj = new JSONObject();
		if (reward != null) {
			try {
				Map<String, Object> map = new ObjectMapper().readValue(reward, HashMap.class);
				if (id.equals(map.get("id"))) {
					List<HashMap<String, String>> r = (List<HashMap<String, String>>) map.get("reward");
					for (HashMap<String, String> rewardInfo : r) { // 리워드 배열 받아서
						int rNum = Integer.parseInt(rewardInfo.get("rNum"));
						int price = Integer.parseInt(rewardInfo.get("price"));
						int amount = Integer.parseInt(rewardInfo.get("amount"));
						int getAmount = fundingDetailService.getAmount(rNum);

						if (getAmount < amount) {// 수량 체크하고
							obj.put("result", "amountOver");
							return obj.toString();
						}

						int fdNum = fundingDetailService.fdetailGetMaxNum() + 1;
						FDetailVo fdvo = new FDetailVo(fdNum, id, fNum, rNum, null, null, amount);
						fundingDetailService.insertFDetail(fdvo); // 펀딩내역
						HashMap<String, Object> rewardMap = new HashMap<String, Object>();
						rewardMap.put("price", price * amount);
						rewardMap.put("fNum", fNum);
						fundingDetailService.addCamout(rewardMap); // 현재금액 추가
						rewardMap.put("rNum", rNum);
						rewardMap.put("amount", amount);
						fundingDetailService.updateAmount(rewardMap); // 남은 수량 수정
						FResultVo frvo = new FResultVo(0, fdNum, null);
						rewardMap.put("id", id);
						fundingDetailService.withdraw(rewardMap);
						// 유저 잔고 차감
						fundingDetailService.insertFResult(frvo);// 펀딩 결과 등록
						obj.put("result", "ok");
						obj.put("reward", r);
					}
				} else {
					obj.put("result", "wrongId");
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
		} else {
			obj.put("result", "no");
		}
		return obj.toString();
	}

	@RequestMapping("/funding/getUserInfo")
	@ResponseBody
	public UsersVo getUserInfo(HttpSession session) {
		String id = (String) session.getAttribute("id");
		return fundingDetailService.userInfo(id);
	}

	@RequestMapping(value = "/funding/rewardOk", method = RequestMethod.POST)
	public String applicationRewardOk(int[] rNum, int[] price, int[] amount, Model model, HttpSession session) {
		List<HashMap<String, Object>> rList = new ArrayList<HashMap<String, Object>>();
		for (int i = 0; i < rNum.length; i++) {
			HashMap<String, Object> hm = new HashMap<String, Object>();
			hm.put("rNum", rNum[i]);
			hm.put("price", price[i]);
			hm.put("amount", amount[i]);

			String title = fundingDetailService.rewardDetail(rNum[i]).getTitle();
			hm.put("title", title);

			rList.add(hm);
		}
		String id = (String) session.getAttribute("id");

		model.addAttribute("rewardList", rList);
		model.addAttribute("vo", fundingDetailService.userInfo(id));
		return ".rewardOk";
	}

}
