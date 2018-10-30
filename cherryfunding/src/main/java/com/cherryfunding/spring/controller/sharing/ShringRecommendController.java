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
	
	@RequestMapping(value="/sharing/sharingIsRecommend", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String sharingIsRecommend(String id, int sNum) {
		JSONObject obj = new JSONObject();
		SRecommendVo vo = sRecommendService.isRecomm(new SRecommendVo(0, sNum, id));
		if(vo == null) {
			obj.put("result", "ok");
		}else {
			obj.put("result", "no");
		}
		return obj.toString();
	}

	@RequestMapping(value = "/sharing/sharingRecommend", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String sharingRecommend(String id, int sNum, String recomm) {
		JSONObject obj = new JSONObject();
		System.out.println("id: " + id);
		System.out.println("sNum: " + sNum);
		System.out.println("recomm: " + recomm);
		
		if (recomm.equals("recomm")) {
			obj.put("recomm", sRecommendService.insert(new SRecommendVo(sRecommendService.getMaxNum() + 1, sNum, id)));
		} else {
			obj.put("recomm", sRecommendService.delete(new SRecommendVo(0, sNum, id)));
		}
		return obj.toString();
	}

}
