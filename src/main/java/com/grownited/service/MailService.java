package com.grownited.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {

	@Autowired
	JavaMailSender mailSender;
	
	 Random random = new Random();
	 
	 public String generateOtp()
	 {
		 int otp = 100000 + random.nextInt(900000);
		 return String.valueOf(otp);
	 }
	 
	 public void sendOtpMail(String email, String otp)
	 {
		 SimpleMailMessage message = new SimpleMailMessage();
		 message.setTo(email);
		 message.setSubject("Password Reset OTP");
		 message.setText("Your OTP for password reset is: " + otp);
		 mailSender.send(message);
	 }
	
	public void sendWelcomeMail(String email, String firstName) {
		String subject = "Welcome to E-Garage";
		String body = "Hello " + firstName
				+ " We're excited to have you on board. If you have any questions, feel free to reach out – we’re here to help!";
	
		String from = "arumugampandaram65@gmail.com";
		
		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setFrom(from);
		message.setTo(email);
		message.setSubject(subject);
		message.setText(body);
		
		mailSender.send(message);
		
		
	}

}
