package com.cherryfunding.spring.batch;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cherryfunding.spring.service.user.UserSettingService;
import com.cherryfunding.spring.service.volunteer.VListService;
import com.cherryfunding.spring.service.volunteer.VolunteerService;

@Controller
public class EmailController {

	@Autowired
	private VolunteerService volunteerService;

	@Autowired
	private VListService vListService;

	@Autowired
	private UserSettingService userSettingService;

	public void mailSender() {
		////////////// 봉사일 하루 전에 신청자에게 이메일 보내기////////////////
		// dday가 sysdate 하루 전인 봉사글(vNum)을 (volunteer로부터) List<Integer>로 얻어오기
		List<Integer> numList = volunteerService.getNearNum();
		for (int a = 0; a < numList.size(); a++) { // 글 개수만큼 아래를 반복
			// 해당 글(vNum)의 신청자 id를 (vList로부터) List<String>으로 얻어오기
			List<String> list = vListService.getNearId(numList.get(a));
			// 얻어온 id의 email을 (users로부터) 얻어오기 //
			List<String> email = new ArrayList<String>();
			for (int i = 0; i < list.size(); i++) {
				String el = userSettingService.getEmail(list.get(i).toString());
				email.add(el);
			}
			System.out.println("이메일목록: " + email);

			// 이메일 보내기
			for (int j = 0; j < email.size(); j++) {
				String host = "smtp.naver.com"; // 네이버 개인 메일 환경설정에서 SMTP 사용 허가해야 함. gmail쓰려면 smtp.gmail.com이라 쓰고 환경설정에서
												// 보안 수준이 낮은 앱의 접근 허가해야 함
				final String username = "id"; // 네이버 아이디(아이디만)
				final String password = "pwd"; // 네이버 이메일 비밀번호.
				int port = 465; // 포트번호

				String recipient = email.get(j).toString(); // 받는 사람의 메일주소
				String subject = "봉사 D-1"; // 메일 제목
				String body = "안녕하세요. 체리펀딩입니다. 내일 봉사일인거 잊지 않으셨죠?ㅎ"; // 메일 내용

				Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성 // SMTP 서버 정보 설정
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.port", port);
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.ssl.enable", "true");
				props.put("mail.smtp.ssl.trust", host); // Session 생성
				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					String un = username;
					String pw = password;

					protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
						return new javax.mail.PasswordAuthentication(un, pw);
					}
				});
				session.setDebug(true); // for debug
				Message mimeMessage = new MimeMessage(session); // MimeMessage 생성
				try {
					mimeMessage.setFrom(new InternetAddress("ims222@naver.com")); // 발신자 셋팅 , 보내는 사람의 전체 이메일 주소 입력
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); // 수신자셋팅 //.TO
																										// 외에 .CC(참조)
																										// .BCC(숨은참조) 도
																										// 있음
					mimeMessage.setSubject(subject); // 제목셋팅
					mimeMessage.setText(body); // 내용셋팅
					Transport.send(mimeMessage); // javax.mail.Transport.send() 이용
					System.out.println("이메일 전송완료");
				} catch (Exception e) {
					e.getMessage();
				}
			} // 이메일 보내기 for문
		} // 첫번째 for문
	}

}
