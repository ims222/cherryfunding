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
import com.cherryfunding.spring.dao.RestKeyDao;
import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.util.ClobToString;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.util.StringLengthCut;
import com.cherryfunding.spring.vo.CPictureVo;

@Service
public class PrepareCharityListService {

	@Autowired
	private RestKeyDao restKeyDao;

	@Autowired
	private CharityDao cdao;

	@Autowired
	private CPictureDao cpdao;

	@Autowired
	private UsersDao usersDao;

	@Autowired
	private CRecommendDao cRecommendDao;

	public List<HashMap<String, Object>> list(HashMap<String, Object> map) {
		List<HashMap<String, Object>> list = cdao.prepare(map);
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
			S3Util s3Util = new S3Util(restKeyDao.getKeyValue("s3_accessKey"),
					restKeyDao.getKeyValue("s3_secretKey"));
			l.put("savename", s3Util.getFileURL("charity/" + thumbnail));
			l.put("cpinfo", this.thumbnail(((BigDecimal) l.get("CNUM")).intValue()).getCpinfo());

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

	public int getTotCountPrepare(HashMap<String, Object> map) {
		return cdao.getTotCountPrepare(map);
	}
}
