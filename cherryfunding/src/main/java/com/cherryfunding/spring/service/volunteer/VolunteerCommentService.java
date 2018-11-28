package com.cherryfunding.spring.service.volunteer;

import java.sql.Clob;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.RestKeyDao;
import com.cherryfunding.spring.dao.UserSettingDao;
import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.dao.VCommentDao;
import com.cherryfunding.spring.util.ClobToString;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.vo.VCommentVo;

@Service
public class VolunteerCommentService {

	@Autowired
	private VCommentDao vCommentDao;

	@Autowired
	private UsersDao usersDao;

	@Autowired
	private UserSettingDao userSettingDao;

	@Autowired
	private RestKeyDao restKeyDao;

	public int insert(VCommentVo vo) {
		return vCommentDao.insert(vo);
	}

	public int getMaxNum() {
		return vCommentDao.getMaxNum();
	}

//	public List<VCommentVo> commentList(int vNum) {
//		return vCommentDao.commentList(vNum);
//	}

	public int delete(int vcNum) {
		return vCommentDao.delete(vcNum);
	}

	public List<HashMap<String, Object>> commentList(int vNum) {
		List<HashMap<String, Object>> list = vCommentDao.commentList(vNum);
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
}
