package com.cherryfunding.spring.controller.sharing;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.sharing.SRecommendService;
import com.cherryfunding.spring.vo.FRecommendVo;
import com.cherryfunding.spring.vo.SRecommendVo;

@Controller
public class ShringRecommendController {

	@Autowired
	SRecommendService sRecommendService;
 
	@RequestMapping(value = "/sharing/sharingIsRecommend", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String isRecomm(String id, int sNum) {
		JSONObject obj = new JSONObject();
		SRecommendVo vo = sRecommendService.isRecomm(new SRecommendVo(0, sNum, id));

		if (vo == null) {
			obj.put("result", "ok");
		} else {
			obj.put("result", "no");
		}
		obj.put("sRecommend", sRecommendService.getRecommend(sNum));
		return obj.toString();
	}

	@RequestMapping(value = "/sharing/sharingRecommend", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String sharingRecommend(String id, int sNum, String recomm) {
		JSONObject obj = new JSONObject();

		if (recomm.equals("recomm")) {
			SRecommendVo srvo = new SRecommendVo(sRecommendService.getMaxNum() + 1, sNum, id);
			obj.put("recomm", sRecommendService.insert(srvo));
		} else
			obj.put("recomm", sRecommendService.delete(new SRecommendVo(0, sNum, id)));

		return obj.toString();
	}

}
