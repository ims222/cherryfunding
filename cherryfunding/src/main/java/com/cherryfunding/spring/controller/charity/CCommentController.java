package com.cherryfunding.spring.controller.charity;

import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.charity.CCommentService;
import com.cherryfunding.spring.service.funding.FCommentService;
import com.cherryfunding.spring.vo.CCommentVo;
import com.cherryfunding.spring.vo.FCommentVo;

@Controller
public class CCommentController {

	@Autowired
	private CCommentService cCommentService;

	@RequestMapping(value = "/charity/insertComment", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertComment(String id, String content, int cNum) {
		CCommentVo ccvo = new CCommentVo();
		ccvo.setCcNum(cCommentService.getMaxNum() + 1);
		ccvo.setId(id);
		ccvo.setContent(content);
		ccvo.setcNum(cNum);
		JSONObject obj = new JSONObject();

		if (cCommentService.insert(ccvo) > 0)
			obj.put("result", "ok");
		else
			obj.put("result", "no");

		return obj.toString();
	}

	@RequestMapping("/charity/commentList")
	@ResponseBody
	public List<HashMap<String, Object>> commentList(int cNum) {
		List<HashMap<String, Object>> list = cCommentService.commentList(cNum);
		return list;
	}

	@RequestMapping(value = "/charity/commentCount", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getCommentCount(int cNum) {
		JSONObject obj = new JSONObject();
		obj.put("commentCount", cCommentService.getCommentCount(cNum));
		return obj.toString();
	}

	@RequestMapping(value = "/charity/commentDelete", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String commentDelete(int ccNum) {
		JSONObject obj = new JSONObject();
		if (cCommentService.delete(ccNum) > 0) {
			obj.put("result", "ok");
		} else {
			obj.put("result", "no");
		}

		return obj.toString();
	}
}
