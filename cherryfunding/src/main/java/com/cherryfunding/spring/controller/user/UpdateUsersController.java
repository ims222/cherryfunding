package com.cherryfunding.spring.controller.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.user.MypageService;
import com.cherryfunding.spring.vo.UsersVo;

@Controller
public class UpdateUsersController {
	
	@Autowired
	private MypageService mpService;
	 
	@RequestMapping(value="/users/getInfo",method=RequestMethod.GET)
	public String getInfo(HttpSession session,Model model) {
		String id=(String)session.getAttribute("id");
		UsersVo vo=new UsersVo();
		vo=mpService.getInfo(id);
		model.addAttribute("vo",vo);
		return "user/userInfo/mypage/mypageUpdate";
	}
	@RequestMapping("/users/updateUsers")
	@ResponseBody
	public UsersVo updateUsers(UsersVo vo) {
		mpService.updateUsers(vo);
		return mpService.getInfo(vo.getId());
	}
	

}
