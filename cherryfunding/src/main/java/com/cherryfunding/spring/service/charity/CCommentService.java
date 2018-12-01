package com.cherryfunding.spring.service.charity;

import java.sql.Clob;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.CCommentDao;
import com.cherryfunding.spring.dao.RestKeyDao;
import com.cherryfunding.spring.dao.UserSettingDao;
import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.util.ClobToString;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.vo.CCommentVo;

@Service
public class CCommentService {

	@Autowired
	private UsersDao usersDao;

	@Autowired
	private UserSettingDao userSettingDao;
 
	@Autowired
	private CCommentDao cCommentDao;

	@Autowired
	private RestKeyDao restKeyDao;

	public int insert(CCommentVo vo) {
		return cCommentDao.insert(vo);
	}

	public int getMaxNum() {
		return cCommentDao.getMaxNum();
	}

	public int getCommentCount(int cNum) {
		return cCommentDao.getCommentCount(cNum);
	}

	public List<HashMap<String, Object>> commentList(int cNum) {
		List<HashMap<String, Object>> list = cCommentDao.commentList(cNum);
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
			S3Util s3Util = new S3Util(restKeyDao.getKeyValue("s3_accessKey"),
					restKeyDao.getKeyValue("s3_secretKey"));
			String savename = s3Util.getFileURL("profile/" + profile);
			l.put("savename", savename);
			String nick = usersDao.select(id).getNick();
			l.put("nick", nick);
		}
		return list;
	}

	public int delete(int ccNum) {
		return cCommentDao.delete(ccNum);
	}

}