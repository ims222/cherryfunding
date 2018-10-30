package com.cherryfunding.spring.controller.sharing;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.sharing.SRecommendService;
import com.cherryfunding.spring.vo.SRecommendVo;

@Controller
public class ShringRecommendController {

	@Autowired
	SRecommendService sRecommendService;
	
	@ResponseBody
	@RequestMapping(value = "/sharing/sharingRecommend", produces = "application/json;charset=UTF-8")
	public String sharingRecommend(String id, int sNum) {
		JSONObject obj = new JSONObject();
		SRecommendVo sRecommendVo = sRecommendService.isRecomm(new SRecommendVo(0, sNum, id));
		if (sRecommendVo != null) { //추천 취소
			sRecommendService.delete(new SRecommendVo(0, sNum, id));
			obj.put("result", "cancel");
		} else { //추천 등록
			sRecommendService.insert(new SRecommendVo(sRecommendService.getMaxNum() + 1, sNum, id));
			obj.put("result", "recommend");
		}
		return obj.toString();
	}
}
