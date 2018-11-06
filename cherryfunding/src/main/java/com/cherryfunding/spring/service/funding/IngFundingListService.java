package com.cherryfunding.spring.service.funding;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.FPictureDao;
import com.cherryfunding.spring.dao.FundingDao;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.vo.FPictureVo;
import com.cherryfunding.spring.vo.FundingVo;

@Service
public class IngFundingListService {
	@Autowired
	private FundingDao fundingDao;

	@Autowired
	private FPictureDao fpdao;

	@Autowired
	private S3Util s3;

	public List<FundingVo> list(HashMap<String, Object> map) {
		List<FundingVo> list = fundingDao.ing(map);
		for (FundingVo vo : list) {
			String thumbnail = this.thumbnail(vo.getfNum()).getSavename();
			vo.setSavename(s3.getFileURL("funding/" + thumbnail));
			vo.setFpinfo(this.thumbnail(vo.getfNum()).getFpinfo());
		}
		return list;
	}

	public FPictureVo thumbnail(int fNum) {
		return fpdao.thumbnail(fNum);
	}

	public List<FundingVo> searchHashtag(String hashtag) {
		List<FundingVo> list = fundingDao.hashtag(hashtag);
		for (FundingVo vo : list) {
			String thumbnail = this.thumbnail(vo.getfNum()).getSavename();
			vo.setSavename(s3.getFileURL("funding/" + thumbnail));
			vo.setFpinfo(this.thumbnail(vo.getfNum()).getFpinfo());
		}
		return list;
	}
}
