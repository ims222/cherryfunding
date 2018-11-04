package com.cherryfunding.spring.service.sharing;

import java.util.HashMap;

import com.cherryfunding.spring.vo.SItemVo;
import com.cherryfunding.spring.vo.SListVo;

public interface SharingConfirmService {

	public int confirm(int slNum);

	public SListVo slDetail(int slNum);

	public int updateAmount(HashMap<String, Object> map);

	public SItemVo siDetail(int siNum);
}
