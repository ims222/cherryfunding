package com.cherryfunding.spring.service.sharing;

import java.util.HashMap;

import com.cherryfunding.spring.vo.SListVo;

public interface SharingDetailService {
	int sListInsert(SListVo sListVo);

	int updateAmount(HashMap<String, Object> map);
}
