package com.cherryfunding.spring.controller.visit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.cherryfunding.spring.dao.VisitorDao;
import com.cherryfunding.spring.vo.VisitorVo;


public class VisitorStatistics implements HttpSessionListener {

//	@Autowired VisitorDao VisitorDao;
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		HttpSession session = se.getSession();
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		ApplicationContext ac=new ClassPathXmlApplicationContext("root-context.xml");

		VisitorDao VisitorDao=(VisitorDao)ac.getBean("visitorDao");
		String v_ip= req.getRemoteAddr();
		String v_refer=req.getHeader("User-Agent");
		System.out.println(v_ip+v_refer);
		
		VisitorVo vo= new VisitorVo(v_ip,v_refer,null);
		System.out.println(vo);
		int n=VisitorDao.insert(vo);
		
		
		if(n>0) {
			System.out.println("성공@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2");
			int count = VisitorDao.visitorcount();
			session.setAttribute("count", count);
		}else {
			System.out.println("실패@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2");
		}
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		
	}

}
