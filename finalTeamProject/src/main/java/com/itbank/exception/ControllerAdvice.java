package com.itbank.exception;

import org.mybatis.spring.MyBatisSystemException;
import org.springframework.web.bind.annotation.ExceptionHandler;

@org.springframework.web.bind.annotation.ControllerAdvice
public class ControllerAdvice {
	
	@ExceptionHandler(MyBatisSystemException.class)
	public String notLogin() {
		
		return "/member/login";
	}
}
