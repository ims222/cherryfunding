package com.cherryfunding.spring.controller.volunteer;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.volunteer.VListService;
import com.cherryfunding.spring.vo.VListVo;


@Controller
public class VolunteerApplyController {
	
	@Autowired
	private VListService vListService;
	
	@RequestMapping(value="/volunteer/volunteerIsApply", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String volunteerIsApply(String id, int vNum) {	//신청 여부 조회
		JSONObject obj=new JSONObject();
		VListVo vo=vListService.isApply(new VListVo(vNum, id));
		if(vo==null) {
			obj.put("result","ok");
		}else {
			obj.put("result", "no");
		}
		return obj.toString();
	}
	@RequestMapping(value="/volunteer/volunteerApply", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String volunteerApply(String id, int vNum, String apply) {
		JSONObject obj = new JSONObject();
		if (apply.equals("apply")) {	//신청 데이터 올리기 
			VListVo vlvo = new VListVo(vListService.getMaxNum() + 1, vNum, id, "내용");
			obj.put("recomm", vListService.insert(vlvo));
		} else
			obj.put("recomm", vListService.delete(new VListVo(0, vNum, id, "내용")));
		return obj.toString();
	}
}
