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
	private FundingDao fundingDao;

	@Autowired
	private FPictureDao fpdao;

	public List<FundingVo> list() {
		return fundingDao.list();
	}

	public FundingVo select(int fNum) {
		return fundingDao.select(fNum);
	}

	public int insert(FundingVo vo) {
		return fundingDao.insert(vo);
	}

	public int update(FundingVo vo) {
		return fundingDao.update(vo);
	}

	public int delete(int fNum) {
		return fundingDao.delete(fNum);
	}

	public int getMaxNum() {
		return fundingDao.getMaxNum();
	}

	public FPictureVo thumbnail(int fNum) {
		return fpdao.thumbnail(fNum);
	}

	public List<FundingVo> ingAll() {
		return fundingDao.ingAll();
	}

}
