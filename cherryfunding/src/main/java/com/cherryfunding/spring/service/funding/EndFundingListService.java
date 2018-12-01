package com.cherryfunding.spring.service.funding;

import java.math.BigDecimal;
import java.sql.Clob;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.FPictureDao;
import com.cherryfunding.spring.dao.FRecommendDao;
import com.cherryfunding.spring.dao.FundingDao;
import com.cherryfunding.spring.dao.RestKeyDao;
import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.util.ClobToString;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.util.StringLengthCut;
import com.cherryfunding.spring.vo.FPictureVo;
import com.cherryfunding.spring.vo.FundingVo;

@Service
public class EndFundingListService {
	@Autowired
	private FundingDao fundingDao; 

	@Autowired
	private FPictureDao fpdao;

	@Autowired
	private UsersDao usersDao;

	@Autowired
	private FRecommendDao fRecommendDao;

	@Autowired
	private RestKeyDao restKeyDao;

	public List<HashMap<String, Object>> list(HashMap<String, Object> map) {
		List<HashMap<String, Object>> list = fundingDao.end(map);
		for (HashMap<String, Object> l : list) {
			int fNum = 0;
			if ((BigDecimal) l.get("FNUM") instanceof BigDecimal) {
				fNum = ((BigDecimal) l.get("FNUM")).intValue();
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
			String thumbnail = this.thumbnail(fNum).getSavename();
			S3Util s3Util = new S3Util(restKeyDao.getKeyValue("s3_accessKey"),
					restKeyDao.getKeyValue("s3_secretKey"));
			l.put("savename", s3Util.getFileURL("funding/" + thumbnail));
			l.put("fpinfo", this.thumbnail(((BigDecimal) l.get("FNUM")).intValue()).getFpinfo());

			String id = (String) l.get("ID");
			String nick = "";
			if (id == null) {
				nick = "AnonymousUser";
			} else {
				nick = usersDao.select(id).getNick();
			}
			l.put("nick", nick);
			l.put("recomm", fRecommendDao.getRecommend(((BigDecimal) l.get("FNUM")).intValue()));
		}
		return list;
	}

	public FPictureVo thumbnail(int fNum) {
		return fpdao.thumbnail(fNum);
	}

	public int getTotCountEnd(HashMap<String, Object> map) {
		return fundingDao.getTotCountEnd(map);
	}

}
