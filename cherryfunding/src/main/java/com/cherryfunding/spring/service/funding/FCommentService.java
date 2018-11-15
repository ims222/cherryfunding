package com.cherryfunding.spring.service.funding;

import java.sql.Clob;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.FCommentDao;
import com.cherryfunding.spring.dao.UserSettingDao;
import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.util.ClobToString;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.vo.FCommentVo;

@Service
public class FCommentService {

	@Autowired
	private UsersDao usersDao;

	@Autowired
	private UserSettingDao userSettingDao;

	@Autowired
	private FCommentDao fCommentDao;

	@Autowired
	private S3Util s3;

	@Autowired
	private ClobToString clobToString;

	public int insert(FCommentVo vo) {
		return fCommentDao.insert(vo);
	}

	public int getMaxNum() {
		return fCommentDao.getMaxNum();
	}

	public int getCommentCount(int fNum) {
		return fCommentDao.getCommentCount(fNum);
	}

	public List<HashMap<String, Object>> commentList(int fNum) {
		List<HashMap<String, Object>> list = fCommentDao.commentList(fNum);
		for (HashMap<String, Object> l : list) {
			if ((Clob) l.get("CONTENT") instanceof Clob) {
				try {
					String content = ClobToString.clobToString((Clob) l.get("CONTENT"));
					l.put("CONTENT", content);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
			String id = (String) l.get("ID");
			String profile = userSettingDao.getInfo(id).getProfile();
			String savename = s3.getFileURL("profile/" + profile);
			l.put("savename", savename);
			String nick = usersDao.select(id).getNick();
			l.put("nick", nick);
		}
		return list;
	}

}