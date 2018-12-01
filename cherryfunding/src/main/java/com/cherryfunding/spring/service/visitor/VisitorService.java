package com.cherryfunding.spring.service.visitor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.VisitorDao;
import com.cherryfunding.spring.vo.VisitorVo;

@Service
public class VisitorService {

	@Autowired
	VisitorDao VisitorDao;

	public int insert(VisitorVo vo) {
		return VisitorDao.insert(vo);
	}

	public int visitorcount() {// 하루 방문자 검색
		return VisitorDao.visitorcount();
	}

	public int dvisitorcount(String date) {
		return VisitorDao.dvisitorcount(date);
	}

	public int ftotalprice() { // 전체 펀딩금액
		return VisitorDao.ftotalprice();
	}

	public int ctotalprice() {// 전체 후원금액
		return VisitorDao.ctotalprice();
	}

	public int tfprice(String date) {// 오늘 펀딩 금액
		return VisitorDao.tfprice(date);
	}

	public int tcprice(String date) {// 오늘 후원 금액
		return VisitorDao.tcprice(date);
	}

}
