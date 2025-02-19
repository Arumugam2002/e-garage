package com.grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.Payment;
import com.grownited.repository.paymentRepository;

@Controller
public class PaymentController {

	@Autowired
	paymentRepository paymentRepository;
	
	@GetMapping("payment")
	public String getPayment()
	{
		return "payment";
	}
	
	@PostMapping("savepayment")
	public String getSavePayment(Payment payment)
	{
		
		System.out.println(payment.getPaymentStatus());
		System.out.println(payment.getAmountPaid());
		System.out.println(payment.getPaymentDate());
		
		paymentRepository.save(payment);
		
		return "index";
	}
	
	
}
