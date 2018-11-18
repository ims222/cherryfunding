package com.cherryfunding.spring.service.funding;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cherryfunding.spring.dao.FDetailDao;
import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.vo.FDetailVo;
import com.cherryfunding.spring.vo.UsersVo;

@Transactional
@Service
public class FundingResultServiceImpl implements FundingResultService {

	@Autowired
	private FDetailDao fDetailDao;


	public List<HashMap<String, Object>> isSuccess() {
		return fDetailDao.isSuccess();
	}

	public int update(FDetailVo vo) {
		return fDetailDao.update(vo);
	}

}
