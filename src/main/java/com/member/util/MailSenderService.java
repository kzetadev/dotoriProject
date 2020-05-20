package com.member.util;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

@Service("mailSenderService")
public class MailSenderService {
	@Autowired
	private JavaMailSender mailSender;
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	//회원가입 후 인증메일 발송
	public void sendAuthMail(String mem_id, String mem_email, ServletContext context, AES256Util aes256) {
		
		mailSender.send(new MimeMessagePreparator() {
			public void prepare(MimeMessage mimeMessage) throws MessagingException{
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "utf-8");
				String contents = "<h2>" + mem_id + "님 회원가입 인증메일 입니다.</h2>";
				contents += "<h2>아래의 링크를 클릭하여 인증을 완료합니다.</h2>";
				String uuidStr = UUID.randomUUID().toString();
				String encMem_id = "";
				String encUUIDStr = "";
				Map<String, String> map = new HashMap<String, String>();
				try {
					encMem_id = aes256.aesEncode(mem_id);
					System.out.println("mem_id : " + mem_id + "\tdecoded mem_id : " + aes256.aesDecode(encMem_id) + "\tencMem_id : " + encMem_id);
					encUUIDStr = aes256.aesEncode(uuidStr);
					map.put("mem_id", mem_id);			//평문 아이디
					map.put("encMem_id", encMem_id);	//암호화된 아이디
					map.put("uuid", uuidStr);			//평문 고유키
					map.put("encUUID", encUUIDStr);		//암호화된 고유키
					System.out.println("mailSender map : " + map);
					//https://zent.tistory.com/117
					//&, + 문자가 자동 변환되어 복호화 실패하는 문제로, 해당 문자를 유니코드로 변환
					encMem_id = encMem_id.replace("&", "%26").replace("+", "%2b");
					encUUIDStr = encUUIDStr.replace("&", "%26").replace("+", "%2b");
					System.out.println("uuidStr : " + uuidStr + "\tdecoded uuidStr : " + aes256.aesDecode(encUUIDStr) + "\tencUUIDStr : " + encUUIDStr);
				}catch(Exception e) {
					System.out.println(e);
				}
				
				String authLink = "http://localhost:8088/mailAuth.do?mem_id=" + encMem_id + "&key=" + encUUIDStr;
				System.out.println(authLink);
				contents += "<a href='" + authLink + "'>" + authLink + "</a>";
				message.setFrom("kzeta@naver.com");
				message.setTo(mem_email);
				message.setSubject("회원가입 인증메일");
				message.setText(contents, true);
//				message.addInline("myLogo", new ClassPathResource("/img/sunimg.jpg"));
				//세션은 해당 브라우저에만 해당하므로 컨텍스트로 유지시킴
				//JoinController의 /mailAuth.do에서 사용.
				context.setAttribute(mem_id, map);
			};
		});
	}
}
