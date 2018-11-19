package com.cherryfunding.spring.service.charity;

import java.math.BigDecimal;
import java.sql.Clob;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.CPictureDao;
import com.cherryfunding.spring.dao.CRecommendDao;
import com.cherryfunding.spring.dao.CharityDao;
import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.util.ClobToString;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.util.StringLengthCut;
import com.cherryfunding.spring.vo.CPictureVo;
import com.cherryfunding.spring.vo.CharityVo;
import com.cherryfunding.spring.vo.FPictureVo;

@Service
public class EndCharityListService {
	@Autowired
	private CharityDao dao;

	@Autowired
	private S3Util s3;

	@Autowired
	private UsersDao usersDao;

	@Autowired
	private CPictureDao cpdao;

	@Autowired
	private CRecommendDao cRecommendDao;

	public List<HashMap<String, Object>> list(HashMap<String, Object> map) {
		List<HashMap<String, Object>> list = dao.end(map);
		for (HashMap<String, Object> l : list) {
			int cNum = 0;
			if ((BigDecimal) l.get("CNUM") instanceof BigDecimal) {
				cNum = ((BigDecimal) l.get("CNUM")).intValue();
			}
			if ((Clob) l.get("CONTENT") instanceof Clob) {
				try {
					String content = ClobToString.clobToString((Clob) l.get("CONTENT"));
					l.put("CONTENT", content);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}

			try {
				String title = (String) l.get("TITLE");
				l.put("TITLE", StringLengthCut.getString(title));
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			String thumbnail = this.thumbnail(cNum).getSaveName();
			l.put("savename", s3.getFileURL("funding/" + thumbnail));
			l.put("fpinfo", this.thumbnail(((BigDecimal) l.get("CNUM")).intValue()).getCpinfo());

			String id = (String) l.get("ID");
			String nick = "";
			if (id == null) {
				nick = "AnonymousUser";
			} else {
				nick = usersDao.select(id).getNick();
			}
			l.put("nick", nick);
			l.put("recomm", cRecommendDao.getRecommend(((BigDecimal) l.get("CNUM")).intValue()));
		}
		return list;
	}

	public CPictureVo thumbnail(int cNum) {
		return cpdao.thumbnail(cNum);
	}

	public int getTotCountEnd(HashMap<String, Object> map) {
		return dao.getTotCountEnd(map);
	}

}
