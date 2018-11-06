package com.cherryfunding.spring.controller.volunteer;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.volunteer.VListService;
import com.cherryfunding.spring.service.volunteer.VolunteerService;
import com.cherryfunding.spring.vo.VListVo;


@Controller
public class VolunteerApplyController {
	
	@Autowired
	private VListService vListService;
	
	@Autowired
	private VolunteerService volunteerService;
	
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
		if (apply.equals("apply")) {	//신청이 들어왔을 경우
			int members = volunteerService.getMembers(vNum);	//필요인원 가져오기
			int membersNow = vListService.getTotal(vNum);	//현재까지의 신청자 수 가져오기
			if(members > membersNow) {
				//필요인원이 초과되지 않았을 경우
				VListVo vlvo = new VListVo(vListService.getMaxNum() + 1, vNum, id, "내용");
				vListService.insert(vlvo);
				obj.put("result", "insertok");
			}else {	//필요인원이 초과되었을 경우
				obj.put("result", "no");
			}
		}else{	//신청취소가 들어왔을 경우
			vListService.delete(new VListVo(0, vNum, id, "내용"));
			obj.put("result", "deleteok");
		}
		return obj.toString();
	}
}
