package com.cherryfunding.spring.controller.admin;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cherryfunding.spring.service.admin.Ad_Service;
import com.cherryfunding.spring.vo.AdminVo;

@Controller
public class JoinController {
	 
	@Autowired private Ad_Service service;
	
	@RequestMapping(value="/adjoin",method = RequestMethod.GET)
	public String adjoin() {
		return "admin/manage/adminJoin";
	}
	
	@RequestMapping(value="/adjoinagree",method = RequestMethod.GET)
	public String adjoinagree() {
		return "admin/manage/adjoinagree";
	}
	
	@RequestMapping(value="/adjoin",method = RequestMethod.POST)
	public ModelAndView adjoin(AdminVo vo) {
		System.out.println(vo);
		int n = service.insert(vo);
		
		ModelAndView mv = new ModelAndView(".admin");
		
		if(n>0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		return mv;
		
	}
	
	
	@RequestMapping(value="/adjoin/confirm",method=RequestMethod.GET)
	@ResponseBody
	public String joinconfirm(String aid) {
		
		String result = service.search(aid);
		JSONObject json = new JSONObject();
		System.out.println(result);
		if(result!=null) {
			
			json.put("using", true);
			
		}else {
			
			json.put("using", false);
		}
		
		return json.toString();
	}
	
	
	

}
