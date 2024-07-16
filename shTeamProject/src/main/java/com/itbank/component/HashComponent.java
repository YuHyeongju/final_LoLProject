package com.itbank.component;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Component;

@Component	// Controller, Service, Repository
			// 특정 내용에 대한 코드를 수행하기 위해 작동하는 스프링 빈
public class HashComponent {
	
	// 문자열 input을 전달 받아서 sha-512 해시 알고리즘이 적용된 output을 반환하는 함수
	// 입력값이 같으면 출력값도 같다
	// 비밀번호 일치여부를 확인할 수 있다
	// DB에는 해시처리된 값이 저장되므로, DB 관리자도 패스워드를 확인할 수 없다
	
	public String getHash(String input) {
		MessageDigest md;
		
		String output = null;
		try {
			md = MessageDigest.getInstance("SHA-512");
			md.update(input.getBytes());
			output = String.format("%0128x",new BigInteger(1,md.digest()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return output;
	}
}
