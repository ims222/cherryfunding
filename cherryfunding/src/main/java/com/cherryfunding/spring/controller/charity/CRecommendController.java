package com.cherryfunding.spring.controller.charity;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.charity.CRecommendService;
import com.cherryfunding.spring.vo.CRecommendVo;

@Controller
public class CRecommendController {

	@Autowired
	private CRecommendService cRecommendService;

	@RequestMapping(value = "/charity/charityIsRecommend", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String isRecomm(String id, int cNum) {
		JSONObject obj = new JSONObject();

		CRecommendVo crvo = cRecommendService.isRecomm(new CRecommendVo(0, cNum, id));

		if (crvo == null) {
			obj.put("result", "ok");
		} else {
			obj.put("result", "no");
		}
		obj.put("cRecommend", cRecommendService.getRecommend(cNum));
		return obj.toString();
	}

	@RequestMapping(value = "/charity/charityRecommend", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String fundingRecommend(String id, int cNum, String recomm) {
		JSONObject obj = new JSONObject();
		if (recomm.equals("recomm")) {
			CRecommendVo crvo = new CRecommendVo(cRecommendService.getMaxNum() + 1, cNum, id);
			obj.put("recomm", cRecommendService.insert(crvo));
		} else
			obj.put("recomm", cRecommendService.delete(new CRecommendVo(0, cNum, id)));
		return obj.toString();
	}
}
