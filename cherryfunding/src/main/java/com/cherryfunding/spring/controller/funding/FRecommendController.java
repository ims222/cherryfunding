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
	public String isRecomm(String id, int fNum) {
		JSONObject obj = new JSONObject();
		FRecommendVo frvo = fRecommendService.isRecomm(new FRecommendVo(0, fNum, id));

		if (frvo == null) {
			obj.put("result", "ok");
		} else {
			obj.put("result", "no");
		}
		obj.put("fRecommend", fRecommendService.getRecommend(fNum));
		return obj.toString();
	}

	@RequestMapping(value = "/funding/fundingRecommend", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String fundingRecommend(String id, int fNum, String recomm) {
		JSONObject obj = new JSONObject();
		if (recomm.equals("recomm")) {
			FRecommendVo frvo = new FRecommendVo(fRecommendService.getMaxNum() + 1, fNum, id);
			obj.put("recomm", fRecommendService.insert(frvo));
		} else
			obj.put("recomm", fRecommendService.delete(new FRecommendVo(0, fNum, id)));
		return obj.toString();
	}
}
