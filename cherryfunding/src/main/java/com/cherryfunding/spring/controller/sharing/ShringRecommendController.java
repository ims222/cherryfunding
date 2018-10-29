package com.cherryfunding.spring.controller.sharing;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.dao.SRecommendDao;
import com.cherryfunding.spring.vo.SRecommendVo;

@Controller
public class ShringRecommendController {

	@Autowired
	private SRecommendDao sRecommendDao;

	@ResponseBody
	@RequestMapping(value = "/sharing/sharingRecommend", produces = "application/json;charset=UTF-8")
	public String sharingRecommend(String id, int sNum) {
		JSONObject obj = new JSONObject();
		SRecommendVo sRecommendVo = sRecommendDao.isRecomm(new SRecommendVo(0, sNum, id));
		if (sRecommendVo != null) {
			
			obj.put("result", "ok");
		} else {
			obj.put("result", "no");
		}
		return obj.toString();
	}
}
