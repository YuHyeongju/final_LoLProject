package com.itbank.component;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Properties;
import java.util.Scanner;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Component;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

@Component
public class MailComponent {

	private final String host = "smtp.naver.com";
	private final int port = 465;
	private String serverId = "tkdgus7993";
	private String serverPw = "jsh6495";
	
	private Properties props;
	
	// @autowired가 자동으로 스프링 빈을 연결하듯이
	// @value는 자동으로 자원을 연결한다
	// org.springframework.core.io.Resource
	@Value("classpath:mailForm.html")
	private Resource mailForm;
	
	@PostConstruct
	private void init() {
		props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
	}
	public int sendSimpleMessage(String address, String content,String title) {
		Session mailSession = Session.getDefaultInstance(props,new Authenticator() {
			String un = serverId;
			String pw = serverPw;
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		
		mailSession.setDebug(true); 		// 메일 전송 과정을 콘솔창에 출력한다
		
		Message message = new MimeMessage(mailSession);
		
		try {
			message.setFrom(new InternetAddress(serverId + "@naver.com"));	// 보내는 사람
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(address));		// 받는 사람
			message.setSubject(title);		// 제목
			message.setText(content);		// 내용
			
			Transport.send(message);
			return 1;
		} catch (MessagingException e) {
			e.printStackTrace();
			return 0;
		}
		
	}
	public int sendSimpleMessage(HashMap<String, String> param) throws FileNotFoundException, IOException {
		Session mailSession = Session.getDefaultInstance(props,new Authenticator() {
			String un = serverId;
			String pw = serverPw;
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		
		mailSession.setDebug(true); 		// 메일 전송 과정을 콘솔창에 출력한다
		
		Message message = new MimeMessage(mailSession);
		String address = param.get("address");
		String title = param.get("title");
		String content = param.get("content");
		
		String tag = "";
		Scanner sc = new Scanner(mailForm.getFile());
		while(sc.hasNextLine()) {
			tag += sc.nextLine();
		}
//		tag +="<div style=\"padding: 10px; font-size: 20px; margin: 20px auto; \">";
//		tag +="		<p>인증번호는 [%s] 입니다</p>";
//		tag +="</div>";
		content = String.format(tag, content);
		
		try {
			message.setFrom(new InternetAddress(serverId + "@naver.com"));	// 보내는 사람
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(address));		// 받는 사람
			message.setSubject(title);			// 제목
			// message.setText(content);		// 내용
			message.setContent(content,"text/html; charset=utf-8");
			
			Transport.send(message);
			return 1;
		} catch (MessagingException e) {
			e.printStackTrace();
			return 0;
		}
		
	}
}
