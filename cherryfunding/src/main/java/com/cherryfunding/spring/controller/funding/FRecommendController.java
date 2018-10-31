package com.cherryfunding.spring.controller.funding;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.funding.FRecommendService;
import com.cherryfunding.spring.vo.FRecommendVo;

@Controller
public class FRecommendController {

	@Autowired
	private FRecommendService fRecommendService;

	@RequestMapping(value = "/funding/fundingIsRecommend", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String isRecomm(String id, int fnum) {
		JSONObject obj = new JSONObject();
		System.out.println("id: " + id);
		System.out.println("fnum: " + fnum);
		FRecommendVo frvo = fRecommendService.isRecomm(new FRecommendVo(0, fnum, id));

		if (frvo == null) {
			obj.put("result", "ok");
		} else {
			obj.put("result", "no");
		}
		return obj.toString();
	}

	@RequestMapping(value = "/funding/fundingRecommend", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String fundingRecommend(String id, int fnum, String recomm) {
		JSONObject obj = new JSONObject();
		if (recomm.equals("recomm")) {
			FRecommendVo frvo = new FRecommendVo(fRecommendService.getMaxNum() + 1, fnum, id);
			obj.put("recomm", fRecommendService.insert(frvo));
		} else
			obj.put("recomm", fRecommendService.delete(new FRecommendVo(0, fnum, id)));
		return obj.toString();
	}
}
