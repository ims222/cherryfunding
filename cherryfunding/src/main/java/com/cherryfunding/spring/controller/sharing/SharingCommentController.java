package com.cherryfunding.spring.controller.sharing;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.sharing.SharingCommentService;
import com.cherryfunding.spring.vo.SCommentVo;

@Controller
public class SharingCommentController {

	@Autowired
	private SharingCommentService sharingCommentService;
	
	@RequestMapping(value="/sharing/insertComment", method=RequestMethod.POST)
	public String insertComment(SCommentVo vo) {
		vo.setScNum(sharingCommentService.getMaxNum() + 1);
		return "redirect:/sharing/commentList?sNum=" + vo.getsNum();
	}
	
	@RequestMapping(value="/sharing/commentList", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<SCommentVo> commentList(int sNum) {
		return sharingCommentService.commentList(sNum);
	}
	
}
