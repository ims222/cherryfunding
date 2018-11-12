package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.VisitorVo;

@Repository
public class VisitorDao {
	

	@Autowired SqlSession sqlsession;
	private static final String NAMESPACE ="com.cherryfunding.spring.vo.VisitorMapper.";
	
	public int insert(VisitorVo vo) {
		return sqlsession.insert(NAMESPACE+"insert",vo);
	}
	
	public int visitorcount() {
		return sqlsession.selectOne(NAMESPACE+"visitorcount");
	}
	
	public int dvisitorcount(String date) { //오늘 날짜 접속 인원
		return sqlsession.selectOne(NAMESPACE +"dvisitorcount", date);
	}
	public int ftotalprice() { //전체 펀딩금액 
		return sqlsession.selectOne(NAMESPACE+"ftotalprice");
	}
	
	public int ctotalprice() {//전체 후원금액 
		return sqlsession.selectOne(NAMESPACE+ "ctotalprice");
	}
	
	public int tfprice(String date) {//오늘 펀딩 금액 
		return sqlsession.selectOne(NAMESPACE+"tfprice",date);
	}
	
	public int tcprice(String date) {//오늘 후원 금액
		return sqlsession.selectOne(NAMESPACE+"tcprice",date);
	}
	

}
