package com.cherryfunding.spring.batch;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cherryfunding.spring.service.volunteer.VolunteerService;

@Controller
public class BatchController {

	@Autowired
	private VolunteerService volunteerService;

	public void method() { // 마감일 지난 봉사 게시물 제목에 [마감] 붙이기(하루 1회 실행)
		int maxNum = volunteerService.getMaxNum();
		for (int i = 0; i < maxNum; i++) { // 마감일 지난 게시물이 몇 개 있는지 모르므로 그냥 전체 게시물 수만큼 검사..
			HashMap<String, Object> map = volunteerService.getEnded(); // 마감일이 지난 title, vNum을 작은번호부터 가져옴
			if (map != null) {
				int vNum = Integer.parseInt(map.get("VNUM").toString());
				String orgTitle = map.get("TITLE").toString();
				String title = "[마감]" + orgTitle;
				HashMap<String, Object> map1 = new HashMap<String, Object>();
				map1.put("vNum", vNum);
				map1.put("title", title);
				volunteerService.updateEnded(map1);
			}
		}
	}

}
