package com.grownited.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.grownited.entity.Appointment;
import com.grownited.entity.Cart;
import com.grownited.entity.Payment;

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
	
	public void sendInvoiceMail(String email, Appointment appointment, List<Cart> services, Payment payment, String lastFourDigits)
	
	{
		StringBuilder body = new StringBuilder();
	    body.append("Thank you for your payment!\n\n");
	    body.append("Appointment ID: ").append(appointment.getAppointmentId()).append("\n");
	    body.append("Transaction Id:- ").append(payment.getTransactionId()).append("\n");
	    body.append("Date: ").append(payment.getPaymentDate()).append("\n");
	    body.append("Total Paid: ₹").append(payment.getAmountPaid()).append("\n");
	    body.append("Payment Status: ").append(payment.getPaymentStatus()).append("\n");
	    body.append("Paid using Card ending with: **** **** **** ").append(lastFourDigits).append("\n\n");
	    
	    
	    body.append("Services:\n");
	    for (Cart item : services) {
	        body.append("- ").append(item.getServiceName()) // update this if not available directly
	            .append(" (₹").append(item.getPrice()).append(")\n");
	        
	        String subject = "E-Garage Invoice - Appointment #" + appointment.getAppointmentId();
	        
	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setFrom("arumugampandaram65@gmail.com");
	        message.setTo(email);
	        message.setSubject(subject);
	        message.setText(body.toString());
	        
	        mailSender.send(message);
	    }
	}

}
