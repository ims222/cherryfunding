package com.cherryfunding.spring.controller.member;

import java.sql.Date;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cherryfunding.spring.service.TestLoginService;
import com.cherryfunding.spring.vo.UsersVo;

@Controller
public class MemberJoinController {
	@Autowired
	private TestLoginService service;
	
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public String insert() {
		return "insert";
	}
	//전화번호 형태 변환을 위한 메소드
	/*public static String mackPhoneNumber(String phone) {
		String regEx = "(\\d{3})(\\d{3,4})(\\d{4})";
		if (!Pattern.matches(regEx, phone)) {
			
			return null;
			
		}
		return phone.replaceAll(regEx, "$1-$2-$3");
	}*/
	
	
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public ModelAndView insert(String id , String pwd, String nick, String email,
								String addr, String gender, String phone, Date birth) {
		
		
		ModelAndView mv = new ModelAndView("result");
		UsersVo vo = new UsersVo(id, pwd, email, nick,addr,gender,phone,birth,null,0);
		//if (mackPhoneNumber(phone)==null) {
		//	mv.addObject("code","전화번호 형태가 다릅니다");
		//	return mv;
		//}
		int n = service.insert(vo);
		if (n>0) {
			mv.addObject("code","success");
		} else {
			mv.addObject("code","error");
		}
		return mv;
	}
}
