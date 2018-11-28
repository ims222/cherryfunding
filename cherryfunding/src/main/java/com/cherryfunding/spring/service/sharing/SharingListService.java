package com.cherryfunding.spring.service.sharing;

import java.math.BigDecimal;
import java.sql.Clob;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.RestKeyDao;
import com.cherryfunding.spring.dao.SPictureDao;
import com.cherryfunding.spring.dao.SRecommendDao;
import com.cherryfunding.spring.dao.ShareDao;
import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.util.ClobToString;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.vo.SPictureVo;

@Service
public class SharingListService {

	@Autowired
	private ShareDao shareDao;

	@Autowired
	private SPictureDao sPictureDao;

	@Autowired
	private UsersDao usersDao;

	@Autowired
	private SRecommendDao sRecommendDao;

	@Autowired
	private RestKeyDao restKeyDao;

	public List<HashMap<String, Object>> list(HashMap<String, Object> map) {
		List<HashMap<String, Object>> list = shareDao.list(map);
		for (HashMap<String, Object> l : list) {
			int sNum = 0;

			if ((BigDecimal) l.get("SNUM") instanceof BigDecimal) {
				sNum = ((BigDecimal) l.get("SNUM")).intValue();
			}
			if ((Clob) l.get("CONTENT") instanceof Clob) {
				try {
					String content = ClobToString.clobToString((Clob) l.get("CONTENT"));
					l.put("CONTENT", content);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}

			String thumbnail = this.thumbnail(sNum).getSaveName();
			S3Util s3Util = new S3Util(restKeyDao.getKeyValue("s3_accessKey"),
					restKeyDao.getKeyValue("s3_secretKey"));
			l.put("savename", s3Util.getFileURL("sharing/" + thumbnail));
			l.put("spinfo", this.thumbnail(sNum).getsPinfo());

			String id = (String) l.get("ID");
			String nick = "";
			if (id == null) {
				nick = "AnonymousUser";
			} else {
				nick = usersDao.select(id).getNick();
			}
			l.put("nick", nick);
			l.put("recomm", sRecommendDao.getRecommend(((BigDecimal) l.get("SNUM")).intValue()));
		}
		return list;
	}

	public SPictureVo thumbnail(int sNum) {
		return sPictureDao.thumbnail(sNum);
	}

	public int getTotCount() {
		return shareDao.getTotCount();
	}
}
