package com.cherryfunding.spring.service.funding;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.FPictureDao;
import com.cherryfunding.spring.dao.FundingDao;
import com.cherryfunding.spring.vo.FPictureVo;
import com.cherryfunding.spring.vo.FundingVo;

@Service
public class FundingService {
	@Autowired
	private FundingDao dao;

	@Autowired
	private FPictureDao fpdao;

	public List<FundingVo> list() {
		return dao.list();
	}

	public FundingVo select(int num) {
		return dao.select(num);
	}

	public int insert(FundingVo vo) {
		return dao.insert(vo);
	}

	public int update(FundingVo vo) {
		return dao.update(vo);
	}

	public int delete(int num) {
		return dao.delete(num);
	}

	public int getMaxNum() {
		return dao.getMaxNum();
	}

	public FPictureVo thumbnail(int fNum) {
		return fpdao.thumbnail(fNum);
	}

}
