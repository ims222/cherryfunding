package com.cherryfunding.spring.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.MypageDao;
import com.cherryfunding.spring.vo.MypageVo;

@Service
public class MypageService {
	@Autowired
	private MypageDao dao;
	
	public int charitySum(String id) {
		return dao.charitySum(id);
	}
	public int fundingSum(String id) {
		return dao.charitySum(id);
	}
	
	public List<MypageVo> charityList(String id) {
		return dao.charityList(id);
	}
	public List<MypageVo> fundingList(String id) {
		return dao.fundingList(id);
	}
}
