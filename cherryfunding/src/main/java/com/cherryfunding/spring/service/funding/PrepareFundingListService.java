package com.cherryfunding.spring.service.funding;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.FPictureDao;
import com.cherryfunding.spring.dao.FundingDao;
import com.cherryfunding.spring.vo.FPictureVo;
import com.cherryfunding.spring.vo.FundingVo;

@Service
public class PrepareFundingListService {
	@Autowired
	private FundingDao fdao;
	
	@Autowired
	private FPictureDao fpdao;
	
	public List<FundingVo> list(){
		return fdao.prepare();
	}
	
	public FPictureVo thumbnail(int fNum) {
		return fpdao.thumbnail(fNum);
	}
}
