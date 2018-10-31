package com.cherryfunding.spring.controller.funding;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.funding.FCommentService;
import com.cherryfunding.spring.vo.FCommentVo;

@Controller
public class FCommentController {

	@Autowired
	private FCommentService fCommentService;

	@RequestMapping(value = "/funding/insertComment", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertComment(String id, String content, int fNum) {
		FCommentVo fcvo = new FCommentVo();
		fcvo.setFcNum(fCommentService.getMaxNum() + 1);
		fcvo.setId(id);
		fcvo.setContent(content);
		fcvo.setfNum(fNum);
		JSONObject obj = new JSONObject();

		if (fCommentService.insert(fcvo) > 0)
			obj.put("result", "ok");
		else
			obj.put("result", "no");

		return obj.toString();
	}

	@RequestMapping("/funding/commentList")
	@ResponseBody
	public List<FCommentVo> commentList(int fNum) {
		return fCommentService.commentList(fNum);
	}

}
