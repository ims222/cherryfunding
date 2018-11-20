package com.cherryfunding.spring.controller.charity;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.charity.DonaService;
import com.cherryfunding.spring.vo.CDetailVo;

@Controller
public class DonaController {

	@Autowired
	private DonaService donaService;

	@RequestMapping("/charity/donation")
	public String donationForm(int cNum, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");

		model.addAttribute("cNum", cNum);
		model.addAttribute("userInfo", donaService.userInfo(id));

		return ".donaProcess";
	}

	@RequestMapping("/charity/donaOk")
	@ResponseBody
	public String donaOk(int cNum, int donaPrice, String content, HttpSession session) {
		String id = (String) session.getAttribute("id");
		JSONObject obj = new JSONObject();
		donaService.donation(donaPrice, id); // 후원금액 차감
		CDetailVo cdvo = new CDetailVo(0, id, cNum, donaPrice, content, null);

		int n = donaService.updatecDetail(cdvo); // 후원 내역 등록
		if (n > 0) {
			obj.put("result", "ok");
		} else {
			obj.put("result", "no");
		}

		return obj.toString();
	}
}
