package com.cherryfunding.spring.service.sharing;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cherryfunding.spring.dao.SListDao;
import com.cherryfunding.spring.vo.SListVo;

@Transactional
@Service
public class SharingDetailServiceImpl implements SharingDetailService {

	@Autowired
	private SListDao sListDao;

	public int sListInsert(SListVo sListVo) {
		sListVo.setSlNum(sListDao.getMaxNum() + 1);
		return sListDao.insert(sListVo);
	}

}
