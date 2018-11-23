package com.cherryfunding.spring.controller.volunteer;

import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.volunteer.VolunteerCommentService;
import com.cherryfunding.spring.vo.VCommentVo;


@Controller
public class VolunteerCommentController {
	
	@Autowired
	private VolunteerCommentService volunteerCommentService;

	@RequestMapping(value = "/volunteer/insertComment", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertComment(String id, String content, int vNum) {
		VCommentVo vcvo = new VCommentVo();
		vcvo.setVcNum(volunteerCommentService.getMaxNum() + 1);
		vcvo.setId(id);
		vcvo.setContent(content);
		vcvo.setvNum(vNum);
		JSONObject obj = new JSONObject();
		if (volunteerCommentService.insert(vcvo) > 0)
			obj.put("result", "ok");
		else
			obj.put("result", "no");
		return obj.toString();
	}

//	@RequestMapping("/volunteer/commentList")
//	@ResponseBody
//	public List<VCommentVo> commentList(int vNum) {
//		return volunteerCommentService.commentList(vNum);
//	}
	
	@RequestMapping("/volunteer/commentList")
	@ResponseBody
	public List<HashMap<String, Object>> commentList(int vNum) {
		return volunteerCommentService.commentList(vNum);
	}
	
	@RequestMapping(value = "/volunteer/commentDelete", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String commentDelete(int vcNum) {
		JSONObject obj = new JSONObject();
		if (volunteerCommentService.delete(vcNum) > 0) {
			obj.put("result", "ok");
		} else {
			obj.put("result", "no");
		}

		return obj.toString();
	}
}
