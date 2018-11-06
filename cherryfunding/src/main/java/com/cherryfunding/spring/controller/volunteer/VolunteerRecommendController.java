package com.cherryfunding.spring.controller.volunteer;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.volunteer.VRecommendService;
import com.cherryfunding.spring.vo.VRecommendVo;



@Controller
public class VolunteerRecommendController {

	@Autowired
	private VRecommendService vRecommendService;
	
	@RequestMapping(value="/volunteer/volunteerIsRecommend", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String volunteerIsRecommend(String id, int vNum) {
		JSONObject obj=new JSONObject();
		VRecommendVo vo=vRecommendService.isRecomm(new VRecommendVo(0, vNum, id));
		if(vo==null) {
			obj.put("result", "ok");	//추천가능
		}else {
			obj.put("result", "no");	//이미 추천한 상태 
		}
		return obj.toString();
	}
	
	@RequestMapping(value="/volunteer/volunteerRecommend", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String volunteerRecommend(String id, int vNum, String recomm) {
		JSONObject obj = new JSONObject();

		if (recomm.equals("recomm")) {	//추천 데이터 올리기 
			VRecommendVo vrvo = new VRecommendVo(vRecommendService.getMaxNum() + 1, vNum, id);
			obj.put("recomm", vRecommendService.insert(vrvo));
		} else
			obj.put("recomm", vRecommendService.delete(new VRecommendVo(0, vNum, id)));

		return obj.toString();
	}

}
