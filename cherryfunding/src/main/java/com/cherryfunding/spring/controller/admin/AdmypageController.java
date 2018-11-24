package com.cherryfunding.spring.controller.admin;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cherryfunding.spring.service.admin.UserManageService;
import com.cherryfunding.spring.service.charity.CharityService;
import com.cherryfunding.spring.service.funding.FundingConfirmService;
import com.cherryfunding.spring.service.funding.FundingService;
import com.cherryfunding.spring.vo.CharityVo;
import com.cherryfunding.spring.vo.FundingVo;
import com.cherryfunding.spring.vo.UsersVo;

@Controller
public class AdmypageController {
	
	@Autowired FundingConfirmService FundingConfirmService;//funding 글 목록 가져오기
	@Autowired FundingService fundingService;
	@Autowired CharityService CharityService;//Charity 글 목록 가져오기 
	@Autowired UserManageService UserManageService; //유저 관리 ex) 리스트 ,삭제
	
	
	@RequestMapping(value="/admypage",method=RequestMethod.GET)
	public String admypage(Model model) {
		
		List<FundingVo> vo= FundingConfirmService.waitList();
		List<CharityVo> co= CharityService.waitList();
		model.addAttribute("vo",vo);
		model.addAttribute("co",co);
		
		return ".admypage";
	}
	
	@RequestMapping(value="/admypagea",method=RequestMethod.GET)
	public String admypagelist(Model model) {
		List<FundingVo> vo= FundingConfirmService.waitList();
		List<CharityVo> co= CharityService.waitList();
		model.addAttribute("vo",vo);
		model.addAttribute("co",co);
		
		return ".admypage";
	}
	
	@RequestMapping(value="/funding/confirmdelete",method=RequestMethod.GET)
	public String fdelete(int fNum, Model model) {
		int n = fundingService.delete(fNum); // 삭제
		if (n > 0) {
			return "redirect:/admypagea";
		} else {
			return "redirect:/admypagea";
		}
	}
	
	@RequestMapping(value = "/charity/delete", method = RequestMethod.GET)
	public String cdelete(int cNum, Model model) {
		int n = CharityService.delete(cNum); // 
		if (n > 0) {
			return "redirect:/admypagea";
		} else {
			return "redirect:/admypagea";
		}
	}
	
	@RequestMapping(value="/confirmList",method=RequestMethod.GET)
	public String confirmList(Model model,HttpServletRequest request) {//승인된 리스트
		List<FundingVo> vo= FundingConfirmService.confirmList();
		List<CharityVo> co= CharityService.confirmList();
		model.addAttribute("vo",vo);
		model.addAttribute("co",co);
		
		return ".confirmList";
	}
	
	@RequestMapping(value="/admypage/wait",method=RequestMethod.GET)
	public String wait(int num) {//wait 승인취소
		FundingConfirmService.wait(num);
		
		return "redirect:/confirmList";
	}
	
	@RequestMapping(value="/admypage/cwait",method=RequestMethod.GET)
	public String cwait(int cNum) {//wait 승인취소
		CharityService.wait(cNum);
		
		return "redirect:/confirmList";
	}
	
	@RequestMapping(value="/admypage/confirm",method=RequestMethod.GET)
	public String confirm(int num,String adid) {//승인 하기
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("num", num);
		map.put("aid",adid);
		FundingConfirmService.confirm(map);
		
		return "redirect:/admypage";
		
	}
	
	@RequestMapping(value="/admypage/chirtyconfirm",method=RequestMethod.GET)
	public String chirtyconfirm(int num,String adid) {//승인 하기
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("cNum", num);
		map.put("aid",adid);
		CharityService.confirm(map);
		
		return "redirect:/admypage";
		
	}
	
	@RequestMapping(value="/usermanage",method=RequestMethod.GET)
	public String usermanage(Model mv) {
		List<UsersVo> vo=UserManageService.list();
		mv.addAttribute("vo",vo);
		return ".userList";
	}
	
	@RequestMapping(value="/userdelete",method=RequestMethod.GET)
	public String userdelete(String id) {
		int n = UserManageService.sdelete(id);
		return "redirect:/usermanage";
	}
	
	

}
