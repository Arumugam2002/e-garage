package com.grownited.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.Appointment;
import com.grownited.entity.AppointmentService;
import com.grownited.entity.Cart;
import com.grownited.entity.Payment;
import com.grownited.entity.Users;
import com.grownited.repository.appointmentRepository;
import com.grownited.repository.appointmentServiceRepository;
import com.grownited.repository.cartRepository;
import com.grownited.repository.paymentRepository;
import com.grownited.service.PaymentService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PaymentController {

	@Autowired
	paymentRepository paymentRepository;
	
	@Autowired
	cartRepository cartRepository;
	
	@Autowired
	appointmentRepository appointmentRepository;
	
	@Autowired
	appointmentServiceRepository appointmentServiceRepository;
	
	@Autowired
	PaymentService paymentService;
	
	
	
	@GetMapping("checkout")
	public String getCheckout(Model model, HttpSession session)
	{
		
		Appointment appointment = (Appointment) session.getAttribute("tempAppointment");
		if(appointment!=null)
		{
			model.addAttribute("amount",appointment.getPrice());
		}
		else {
			model.addAttribute("amount",0);
		}
		
		
		return "checkout";
		
	}
	
	
	@PostMapping("pay")
	public String getSavePayment(String ccNum, String expDate, HttpSession session, Model model)
	{
		
		Users user = (Users) session.getAttribute("user");
		String email = user.getEmail();
		
		Appointment appointment = (Appointment) session.getAttribute("tempAppointment");
		List<Cart> cartItems = (List<Cart>) session.getAttribute("cartItems");
		
		if (appointment == null || cartItems == null) {
	        return "redirect:/cart";
	    }
		
	boolean success = paymentService.chargeCreditCard("4f2dkE2E4VpB", "8PZUxB57wm8X84gn", appointment.getPrice(), ccNum, expDate, email);
	
	if(success)
	{
		 Appointment savedAppointment = appointmentRepository.save(appointment);
		 
		 for (Cart item : cartItems) {
	            AppointmentService appService = new AppointmentService();
	            appService.setAppointmentId(savedAppointment.getAppointmentId());
	            appService.setServicesId(item.getServicesId());
	            appService.setPrice(item.getPrice());
	            
	            appointmentServiceRepository.save(appService);
	        }
		 
		 Payment payment = new Payment();
		 
		 payment.setAppointmentRefId(savedAppointment);
		 payment.setPaymentDate(LocalDateTime.now());
		 payment.setAmountPaid(appointment.getPrice());
		 payment.setPaymentStatus("Success");
		 
		 paymentRepository.save(payment);
		 
		 	cartRepository.deleteAll(cartItems);
	        session.removeAttribute("tempAppointment");
	        session.removeAttribute("cartItems");
	        
	        return "redirect:/garages";
	}
	else {
		
		model.addAttribute("error", "Payment Failed");
        return "redirect:/checkout";
	}
	
		
		
	}
	
	
}
