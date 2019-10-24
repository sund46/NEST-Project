package com.nestCor.nest.member.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MailController {

	@Autowired
	private MailSender mailSender;
	
	@RequestMapping(value="/member/mailAuth.do" ,produces="text/plain;charset=utf-8")
	@ResponseBody
	public String emailAuth(@RequestParam("userId") String userId) {
	  
	        
	    String authNum = "";
	        
	    System.out.println(userId);
	    authNum = randomNum();
	    //가입승인에 사용될 인증키 난수 발생    
	    sendEmail(userId, authNum);
	    //이메일전송
	    String str = authNum;
	        
	        
	    return str;
	}
	    
	
	// 난수 발생 메소드
	private String randomNum() {
	    StringBuffer buffer = new StringBuffer();
	        
	    for( int i = 0 ; i <= 6 ; i++) {
	        int n = (int)(Math.random()*10);
	        buffer.append(n);
	    }
	        
	    return buffer.toString();
	}
	 
	public void sendEmail(String email , String authNum ) {
	    //이메일 발송 메소드
	    SimpleMailMessage mailMessage = new SimpleMailMessage();
	    mailMessage.setSubject("[인증] Nest 서비스 회원가입 인증메일입니다.");
	    mailMessage.setFrom("nestcor@naver.com");
	    mailMessage.setText("환영합니다! 좌측 인증번호를 입력해주세요. [ "+authNum+" ]");
	    mailMessage.setTo(email);
	    try {
	        mailSender.send(mailMessage);
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	}
	
	
	
}
