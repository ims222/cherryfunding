package com.cherryfunding.spring.service.sharing;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cherryfunding.spring.dao.SItemDao;
import com.cherryfunding.spring.dao.SListDao;
import com.cherryfunding.spring.vo.SListVo;

@Transactional
@Service
public class SharingDetailServiceImpl {

	@Autowired
	private SListDao sListDao;

	@Autowired
	private SItemDao sItemDao;

	public int sListInsert(SListVo sListVo) {
		sListVo.setSlNum(sListDao.getMaxNum() + 1);
		return sListDao.insert(sListVo);
	}

	public int updateAmount(HashMap<String, Object> map) {
		return sItemDao.updateAmount(map);
	}

}
