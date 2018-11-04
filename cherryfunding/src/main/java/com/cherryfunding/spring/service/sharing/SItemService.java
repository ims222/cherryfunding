package com.cherryfunding.spring.service.sharing;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.SItemDao;
import com.cherryfunding.spring.vo.SItemVo;

@Service
public class SItemService {

	@Autowired
	private SItemDao sItemDao;

	public int getMaxNum() {
		return sItemDao.getMaxNum();
	}

	public List<SItemVo> itemList(int sNum) {
		return sItemDao.itemList(sNum);
	}

	public SItemVo detail(int siNum) {
		return sItemDao.detail(siNum);
	}
}
