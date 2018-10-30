package com.cherryfunding.spring.controller.sharing;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.sharing.SharingCommentService;
import com.cherryfunding.spring.vo.SCommentVo;

@Controller
public class SharingCommentController {

	@Autowired
	private SharingCommentService sharingCommentService;

	@RequestMapping(value = "/sharing/insertComment", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertComment(String id, String content, int sNum) {
		SCommentVo scvo = new SCommentVo();
		scvo.setScNum(sharingCommentService.getMaxNum() + 1);
		scvo.setId(id);
		scvo.setContent(content);
		scvo.setsNum(sNum);
		JSONObject obj = new JSONObject();
		if (sharingCommentService.insert(scvo) > 0) {
			obj.put("result", "ok");
		} else {
			obj.put("result", "no");
		}
		return obj.toString();
	}

	@RequestMapping("/sharing/commentList")
	@ResponseBody
	public List<SCommentVo> commentList(int sNum) {
		System.out.println("sNum: " + sNum);
		return sharingCommentService.commentList(sNum);
	}

}
