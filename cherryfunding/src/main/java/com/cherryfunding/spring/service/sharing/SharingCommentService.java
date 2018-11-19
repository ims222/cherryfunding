package com.cherryfunding.spring.service.sharing;

import java.sql.Clob;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.SCommentDao;
import com.cherryfunding.spring.dao.UserSettingDao;
import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.util.ClobToString;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.vo.SCommentVo;

@Service
public class SharingCommentService {

	@Autowired
	private SCommentDao sCommentDao;

	@Autowired
	private UsersDao usersDao;

	@Autowired
	private UserSettingDao userSettingDao;

	@Autowired
	private S3Util s3;

	public int insert(SCommentVo vo) {
		return sCommentDao.insert(vo);
	}

	public int getMaxNum() {
		return sCommentDao.getMaxNum();
	}

	public List<HashMap<String, Object>> commentList(int sNum) {
		List<HashMap<String, Object>> list = sCommentDao.commentList(sNum);
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
			String profile = "";
			try {
				profile = userSettingDao.getInfo(id).getProfile();
			} catch (Exception e) {
				System.out.println(e.getMessage());
				profile = "default";
			}
			String savename = s3.getFileURL("profile/" + profile);
			l.put("savename", savename);
			String nick = usersDao.select(id).getNick();
			l.put("nick", nick);
		}
		return list;
	}

	public int getCommentCount(int sNum) {
		return sCommentDao.getCommentCount(sNum);
	}

	public int delete(int scNum) {
		return sCommentDao.delete(scNum);
	}
}
